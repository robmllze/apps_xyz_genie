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

import 'package:path/path.dart' as p;

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<ModelGenerateModelSettings?> loadGenerateModelSettingsFromFile({
  required String modelDirPath,
  required String dartSdkPath,
}) async {
  final output = await isolatedRun(
    input: jsonEncode({
      'modelDirPath': modelDirPath,
      'dartSdkPath': dartSdkPath,
    }),
    task: (input) async {
      final decoded = jsonDecode(input!);
      final modelDirPath = decoded['modelDirPath'] as String;
      final dartSdkPath = decoded['dartSdkPath'] as String;
      String? output;
      await analyzeModels(
        fallbackDartSdkPath: dartSdkPath,
        rootDirPaths: {modelDirPath},
        onAnnotation: (filePath, annotation) async {
          final keyStringCase =
              StringCaseType.values.valueOf(annotation.keyStringCase) ??
                  StringCaseType.LOWER_SNAKE_CASE;
          output = ModelGenerateModelSettings(
            className: annotation.className,
            includeId: annotation.includeId,
            includeArgs: annotation.includeArgs,
            outputDirPath: p.normalize(p.join(p.dirname(filePath), '..')),
            shouldInheret: annotation.shouldInherit,
            inheritanceConstructor: annotation.inheritanceConstructor,
            keyStringCase: keyStringCase,
            fieldEntries: annotation.fields?.entries.map((e) {
              final fieldName = e.key;
              final fieldTypeCode = TypeCode(e.value);
              return ModelFieldEntry(
                fieldName: keyStringCase.convertString(fieldName),
                fieldType: fieldTypeCode.value.endsWith('?')
                    ? fieldTypeCode.value
                        .substring(0, fieldTypeCode.value.length - 1)
                    : fieldTypeCode.value,
                isCustomFieldName: true,
                isCustomFieldType: true,
                isNullable: fieldTypeCode.nullable,
              );
            }).toList(),
          ).toJsonString();
        },
      );
      return output;
    },
  );
  return output != null
      ? ModelGenerateModelSettings.fromJsonString(output)
      : null;
}
