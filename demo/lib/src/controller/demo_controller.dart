import 'package:demo/src/service/demo_service.dart';
import 'package:demo/src/service/impl/demo_service_impl.dart';
import 'package:rua_lite/rua_lite.dart';

@Component()
class DemoController {
  @Autowired()
  DemoServiceImpl demoService;

  void printHello() {
    print("[DEMO] ${demoService.getHelloText()}");
  }
}
