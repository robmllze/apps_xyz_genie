//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED BY XYZ_GENIE
// See: https://github.com/robmllze/xyz_gen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:path/path.dart' as p;

import '/_common.dart';

part '_model_cache.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateModel(
  fields: {
    'dart_sdk_path': 'String?',
    'generate_model_settings': 'ModelGenerateModelSettings?',
    'generate_screen_settings': 'ModelGenerateScreenSettings?',
    'initial_screen_path': 'String?',
    'project_root_dir_path': 'String?',
    'templates_dir_path': 'String?',
  },
  shouldInherit: true,
)
// ignore: unused_element
abstract class _ModelCache extends ThisModel<ModelCache> {
  //
  //
  //

  String getTemplatesDirPath() {
    return this.model.templatesDirPath ?? defaultModelCache().templatesDirPath!;
  }

  String getDartSdkPath() {
    return this.model.dartSdkPath ?? defaultModelCache().dartSdkPath!;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

ModelCache defaultModelCache() {
  return ModelCache(
    templatesDirPath: p.normalize(p.join(currentScriptDir, '..', 'templates')),
    dartSdkPath: Platform.environment['DART_SDK'].toString(),
  );
}