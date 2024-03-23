//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// X|Y|Z & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

import 'package:path/path.dart' as p;

part '_model_generate_model_settings.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateModel(
  fields: {
    'className': 'PascalCase-String?',
    'directives': 'List<String>?',
    'exportsTemplateFileName': 'String?',
    'fieldEntries': 'List<ModelFieldEntry>?',
    'includeArgs': 'bool?',
    'includeId': 'bool?',
    'inheritanceConstructor': 'String?',
    'keyStringCase': 'StringCaseType?',
    'modelTemplateFileName': 'String?',
    'outputDirPath': 'String?',
    'shouldInheret': 'bool?',
    'superClassName': 'String?',
  },
  includeId: false,
  shouldInherit: true,
)
abstract class _ModelGenerateModelSettings
    extends ThisModel<ModelGenerateModelSettings> {
  //
  //
  //

  bool getIncludeArgs() {
    return this.model.includeArgs ??
        defaultModelGenerateModelSettings().includeArgs!;
  }

  bool getIncludeId() {
    return this.model.includeId ??
        defaultModelGenerateModelSettings().includeId!;
  }

  bool getShouldInheret() {
    return this.model.shouldInheret ??
        defaultModelGenerateModelSettings().shouldInheret!;
  }

  String getInheritanceConstructor() {
    return this.model.inheritanceConstructor ??
        defaultModelGenerateModelSettings().inheritanceConstructor!;
  }

  List<ModelFieldEntry> getFieldEntries() {
    return this.model.fieldEntries ??
        defaultModelGenerateModelSettings().fieldEntries!;
  }

  String getClassName() {
    return this.model.className ??
        defaultModelGenerateModelSettings().className!;
  }

  String getSuperClassName() {
    return this.model.superClassName ??
        defaultModelGenerateModelSettings().superClassName!;
  }

  String getModelFolderName() {
    return this.getClassName().toSnakeCase();
  }

  String getGeneratedModelFileName() {
    return '_${this.getModelFolderName()}.g.dart';
  }

  String getModelFileName() {
    return '${this.getClassName().toSnakeCase()}.dart';
  }

  String getModelFilePath() {
    return p.join(
      this.getOutputDirPath(),
      this.getModelFolderName(),
      this.getModelFileName(),
    );
  }

  String getOutputDirPath() {
    return this.model.outputDirPath ??
        defaultModelGenerateModelSettings().outputDirPath!;
  }

  String getModelTemplateFileName() {
    return this.model.modelTemplateFileName ??
        defaultModelGenerateModelSettings().modelTemplateFileName!;
  }

  String getExportsTemplateFileName() {
    return this.model.exportsTemplateFileName ??
        defaultModelGenerateModelSettings().exportsTemplateFileName!;
  }

  StringCaseType getKeyStringCase() {
    return this.model.keyStringCase ??
        defaultModelGenerateModelSettings().keyStringCase!;
  }

  List<String> getDirectives() {
    return this.model.directives ??
        defaultModelGenerateModelSettings().directives!;
  }

  String getModelTemplateFilePath(String templateDirPath) {
    return p.join(
      templateDirPath,
      'generate_models',
      this.getModelTemplateFileName(),
    );
  }

  String getExportsTemplateFilePath(String templateDirPath) {
    return p.join(
      templateDirPath,
      'generate_exports',
      this.getExportsTemplateFileName(),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

ModelGenerateModelSettings defaultModelGenerateModelSettings() {
  const template = GenerateModel();
  return ModelGenerateModelSettings(
    className: 'ModelExample',
    superClassName: 'Model',
    outputDirPath: p
        .normalize(p.join(currentScriptDir, '..', 'your_app', 'lib', 'models')),
    exportsTemplateFileName: 'your_exports_template.dart.md',
    modelTemplateFileName: 'your_model_template.dart.md',
    fieldEntries: [defaultModelFieldEntry()],
    includeArgs: template.includeArgs,
    includeId: template.includeId,
    inheritanceConstructor: template.inheritanceConstructor ?? '',
    shouldInheret: template.shouldInherit,
    keyStringCase: StringCaseType.values.valueOf(template.keyStringCase),
    directives: [
      "import '_common.dart';",
    ],
  );
}
