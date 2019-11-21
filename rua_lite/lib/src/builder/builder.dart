import 'package:build/build.dart';
import 'package:rua_lite/src/builder/collector/ConfigurationCollector.dart';
import 'package:rua_lite/src/builder/generator/RuaBootApplicationGenerator.dart';
import 'package:source_gen/source_gen.dart';

Builder configurationCollector(BuilderOptions options) => ConfigurationCollector();
Builder ruaBootApplicationGenerator(BuilderOptions options) => LibraryBuilder(
      RuaBootApplicationGenerator(),
      generatedExtension: '.rua_lite.dart',
      header: "",
    );
