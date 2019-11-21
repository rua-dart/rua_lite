import 'package:rua_lite/src/runtime/RuaApplication.dart';

T useBean<T>(Type type) {
  return RuaApplication.applicationContext.getBean(type);
}
