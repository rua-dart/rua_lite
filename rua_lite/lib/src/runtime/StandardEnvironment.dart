import 'dart:io';

class StandardEnvironment {
  static Map<String, Object> envMap;

  StandardEnvironment();

  bool containsProperty(String key) {
    return getProperty(key) == null;
  }

  String getProperty(String key, [String defaultValue]) {
    Object property = envMap[key] ?? getSystemProperties()[key] ?? getSystemEnvironment()[key];
    return property ?? defaultValue;
  }

  String getRequiredProperty(String key) {
    Object property = getProperty(key);
    assert(property != null, "Required key '$key' not found");
    return property;
  }

  Map<String, Object> getSystemProperties() {
    return {
      "executable": Platform.executable,
      "executableArguments": Platform.executableArguments,
      "isAndroid": Platform.isAndroid,
      "isFuchsia": Platform.isFuchsia,
      "isIOS": Platform.isIOS,
      "isLinux": Platform.isLinux,
      "isMacOS": Platform.isMacOS,
      "isWindows": Platform.isWindows,
      "localeName": Platform.localeName,
      "localHostname": Platform.localHostname,
      "numberOfProcessors": Platform.numberOfProcessors,
      "pathSeparator": Platform.pathSeparator,
      "resolvedExecutable": Platform.resolvedExecutable,
      "resolvedExecutable": Platform.resolvedExecutable,
      "script": Platform.script,
      "version": Platform.version,
      "operatingSystem": Platform.operatingSystem,
      "operatingSystemVersion": Platform.operatingSystemVersion
    };
  }

  Map<String, Object> getSystemEnvironment() {
    return Platform.environment;
  }
}
