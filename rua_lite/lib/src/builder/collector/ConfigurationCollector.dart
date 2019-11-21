import 'dart:async';
import 'dart:convert';
import 'package:rua_lite/src/builder/util/MapUtils.dart';
import 'package:yaml/yaml.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class ConfigurationCollector implements Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    if (!buildStep.inputId.path.startsWith("lib") ||
        (!buildStep.inputId.path.endsWith("/application.yaml") &&
            !buildStep.inputId.path.endsWith("/application.yml"))) {
      return null;
    }
    String content = await buildStep.readAsString(buildStep.inputId);
    YamlMap config = loadYaml(content);
    Map flattenConfig = MapUtils.flatten(config);
    String encodedConfig = json.encode(flattenConfig);

    String output = "StandardEnvironment.projectEnvMap = $encodedConfig;";
    final outputId = buildStep.inputId.changeExtension(".rua_config.rua_extra_initializer.dart");
    await buildStep.writeAsString(outputId, output);
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        ".yaml": [".rua_config.rua_extra_initializer.dart"]
      };
}
