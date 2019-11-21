import 'package:rua_lite/src/runtime/BeanFactory.dart';
import 'package:rua_lite/src/runtime/StandardEnvironment.dart';

class StandardApplicationContext {
  StandardEnvironment _environment;

  BeanFactory _beanFactory;

  StandardApplicationContext() {
    _beanFactory = obtainRefreshBeanFactory();
  }

  void setEnvironment(StandardEnvironment environment) {
    this._environment = environment;
  }

  BeanFactory obtainRefreshBeanFactory() {
    return BeanFactory();
  }

  T getBean<T>(Type identifier) {
    return _beanFactory.getBean(identifier);
  }
}
