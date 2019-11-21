import 'package:rua_lite/rua_lite.dart';
import 'package:rua_lite/src/runtime/RuaApplication.dart';
import 'package:rua_lite/src/runtime/annotation/Autowired.dart';
import 'package:rua_lite/src/runtime/annotation/Component.dart';

import 'rua_lite_example.reflectable.dart';

@Component()
class AService {}

@Service()
class AServiceImpl implements AService {}

@Component()
class A {}

@Component()
class B {
  @Autowired()
  A a;

  @Autowired()
  AService aService;
}

class C {}

void main() {
  initializeReflectable();
  RuaApplication(null).launch();
  B b = useBean(B);
  B b2 = useBean(B);
  AService aService = useBean(AService);
  AServiceImpl aServiceImpl = useBean(AServiceImpl);
  assert(b is B);
  assert(b.a is A);
  assert(b == b2);
  assert(aServiceImpl is AServiceImpl);
  assert(aService == aServiceImpl);
}

//@RuaApplication()
//void main() => runRua(null);
