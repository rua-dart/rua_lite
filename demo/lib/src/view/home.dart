import 'package:demo/src/controller/demo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rua_lite/rua_lite.dart';

class Home extends HookWidget {
  DemoController _demoController = useBean(DemoController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => _demoController.printHello(),
          child: Text("Demo"),
        ),
      ),
      body: Container(
        child: Text("MyHomePage"),
      ),
    );
  }
}
