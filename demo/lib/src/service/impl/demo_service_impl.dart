import 'package:demo/src/service/demo_service.dart';
import 'package:rua_lite/rua_lite.dart';

@Service()
class DemoServiceImpl implements DemoService {
  @override
  String getHelloText() {
    return "Hello!!";
  }
}
