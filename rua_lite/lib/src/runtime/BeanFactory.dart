import 'package:reflectable/mirrors.dart';
import 'package:rua_lite/src/runtime/annotation/Autowired.dart';
import 'package:rua_lite/src/runtime/annotation/Component.dart';
import 'package:rua_lite/src/runtime/annotation/Reflected.dart';
import 'package:rua_lite/src/runtime/annotation/Service.dart';

class BeanFactory {
  Map<Type, Object> singletonBeans = {};

  BeanFactory() {
    for (ClassMirror clazz in reflected.annotatedClasses) {
//      if (clazz.metadata.contains(Component())) {
//        getBean(clazz.reflectedType);
//      }

      if (clazz.metadata.contains(Service())) {
        getBean(clazz.reflectedType);
      }
    }
  }

  T getBean<T>(Type identifier) {
    // singleton
    if (singletonBeans.containsKey(identifier)) {
      return singletonBeans[identifier];
    }
    // reflection check
    if (!reflected.canReflectType(identifier)) {
      print("Class $identifier can not be reflected");
      return null;
    }

    // reflection
    ClassMirror clazz = reflected.reflectType(identifier);
    Object instance = clazz.newInstance("", []);

    // check
    if (!clazz.metadata.contains(Component()) && !clazz.metadata.contains(Service())) {
      print("Class $identifier is abstract or it does not decorated with Component");
      return null;
    }

    // autowired
    InstanceMirror instanceMirror = reflected.reflect(instance);
    List<VariableMirror> autowiredFields = clazz.declarations.values
        .whereType<VariableMirror>()
        .where((e) => e.metadata.whereType<Autowired>().isNotEmpty)
        .toList();
    for (var field in autowiredFields) {
      if (field.isPrivate) {
        print("[RuaLite] $identifier.${field.simpleName} is Private, Ignored");
        continue;
      }
      instanceMirror.invokeSetter(field.simpleName, getBean(field.type.reflectedType));
    }
    // singleton
    singletonBeans[identifier] = instance;

    if (clazz.metadata.contains(Service())) {
      if (clazz.superclass.reflectedType != Object) {
        singletonBeans[clazz.superclass.reflectedType] = instance;
      }
      for (var interface in clazz.superinterfaces) {
        singletonBeans[interface.reflectedType] = instance;
      }
    }

    return instance;
  }
}
