@GlobalQuantifyMetaCapability(Component, reflected)
@GlobalQuantifyMetaCapability(Service, reflected)
import 'package:reflectable/reflectable.dart';
import 'package:rua_lite/src/runtime/annotation/Component.dart';
import 'package:rua_lite/src/runtime/annotation/Service.dart';

class Reflected extends Reflectable {
  const Reflected()
      : super(
          libraryDependenciesCapability,
          invokingCapability,
          newInstanceCapability,
          typingCapability,
          typeRelationsCapability,
          superclassQuantifyCapability,
          subtypeQuantifyCapability,
          typeAnnotationQuantifyCapability,
        );
}

const reflected = Reflected();
