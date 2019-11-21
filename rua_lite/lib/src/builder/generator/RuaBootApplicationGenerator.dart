import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:glob/glob.dart';
import 'package:rua_lite/src/runtime/annotation/RuaBootApplication.dart';
import 'package:source_gen/source_gen.dart';

class RuaBootApplicationGenerator extends GeneratorForAnnotation<RuaBootApplication> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is FunctionElement && element.name == "main") {
      final String packageName = buildStep.inputId.package;

      final List<AssetId> initializerCacheAssetIds = await buildStep
          .findAssets(
            Glob("**/*.rua_extra_initializer.dart"),
          )
          .toList();

      final List<String> initializerStringList = [];
      for (var id in initializerCacheAssetIds) {
        initializerStringList.add(await buildStep.readAsString(id));
      }

      return [
        "import 'package:$packageName/main.reflectable.dart';",
        "import 'package:rua_lite/rua_lite.dart';",
        "void initializeRua() {",
        "initializeReflectable();",
        ...initializerStringList,
        "}"
      ].join("\n");
    }
    return null;
  }
}
