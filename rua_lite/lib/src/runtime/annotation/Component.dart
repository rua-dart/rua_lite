import 'package:rua_lite/src/runtime/annotation/Reflected.dart';
import 'package:reflectable/reflectable.dart';

class Component {
  const Component();

  operator ==(Object other) {
    return other is Component;
  }
}
