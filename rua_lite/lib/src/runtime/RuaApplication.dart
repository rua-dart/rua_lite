import 'package:flutter/cupertino.dart';
import 'package:rua_lite/src/runtime/StandardApplicationContext.dart';
import 'package:rua_lite/src/runtime/StandardEnvironment.dart';

class RuaApplication {
  Widget _rootWidget;

  static StandardApplicationContext applicationContext;

  StandardEnvironment _environment;

  static void run(Widget rootWidget, [List<String> ignoredArgs]) {
    RuaApplication(rootWidget).launch(ignoredArgs);
  }

  RuaApplication(this._rootWidget);

  void launch([List<String> ignoredArgs]) {
    Stopwatch stopwatch = Stopwatch();
    stopwatch.start();
    applicationContext = _createApplicationContext();
    _environment = _prepareEnvironment();
    _prepareContext(applicationContext, _environment);
    stopwatch.stop();
    print("[RuaLite] Time Used: ${stopwatch.elapsedMilliseconds}");
    runApp(_rootWidget);
  }

  void _prepareContext(StandardApplicationContext context, StandardEnvironment environment) {
    context.setEnvironment(environment);
  }

  StandardEnvironment _prepareEnvironment() {
    return StandardEnvironment();
  }

  StandardApplicationContext _createApplicationContext() {
    return StandardApplicationContext();
  }
}
