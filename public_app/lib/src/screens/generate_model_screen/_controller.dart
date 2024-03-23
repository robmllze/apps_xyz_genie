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

part of 'generate_model_screen.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class GenerateModelScreenController extends TGenerateModelScreenController {
  //
  //
  //

  GenerateModelScreenController(super.screen, super.state);

  //
  //
  //

  ModelCache get cache => app.activeSession.pCache.value;
  ModelGenerateModelSettings get settings => app.activeSession.pGenerateModelSettings.value;

  final classNameController = TextEditingController(text: 'ModelExample');
  final superClassNameController = TextEditingController();
  final templatesDirPathController = TextEditingController();
  final outputDirPathController = TextEditingController();
  late final dartSdkPathController =
      TextEditingController(text: Platform.environment['DART_SDK'].toString());
  final directivesController = TextEditingController();

  final pModelTemplatePaths = Pod<List<String>>([]);
  final pExportsTemplatePaths = Pod<List<String>>([]);

  //
  //
  //

  @override
  void dispose() {
    this.classNameController.dispose();
    this.superClassNameController.dispose();
    this.templatesDirPathController.dispose();
    this.outputDirPathController.dispose();
    this.dartSdkPathController.dispose();
    this.directivesController.dispose();
    this.pModelTemplatePaths.dispose();
    this.pExportsTemplatePaths.dispose();
    super.dispose();
  }

  //
  //
  //

  @override
  void initController() {
    this._syncTemplateNames();
    this.refreshTextControllers();
    super.initController();
  }

  //
  //
  //

  void refreshTextControllers() {
    this.classNameController.text = this.settings.getClassName();
    this.superClassNameController.text = this.settings.getSuperClassName();
    this.templatesDirPathController.text = this.cache.getTemplatesDirPath();
    this.outputDirPathController.text = this.settings.getOutputDirPath();
    this.dartSdkPathController.text = this.cache.getDartSdkPath();
    this.directivesController.text = this.settings.getDirectives().join('\n');
  }

  //
  //
  //

  late final syncTemplateNamesDebouncer = Debouncer(
    delay: const Duration(milliseconds: 500),
    onWaited: _syncTemplateNames,
  );

  //
  //
  //

  Future<void> _syncTemplateNames() async {
    final templatesDirPath = this.cache.templatesDirPath;
    if (templatesDirPath != null) {
      try {
        this.pModelTemplatePaths.set(
              (await findFiles(p.join(templatesDirPath, 'generate_models')))
                  .map(
                    (e) => p.relative(
                      e.filePath,
                      from: p.join(templatesDirPath, 'generate_models'),
                    ),
                  )
                  .toList(),
            );
        this.pExportsTemplatePaths.set(
              (await findFiles(p.join(templatesDirPath, 'generate_exports')))
                  .map(
                    (e) => p.relative(
                      e.filePath,
                      from: p.join(templatesDirPath, 'generate_exports'),
                    ),
                  )
                  .toList(),
            );
      } catch (e) {
        // Ignore error
      }
    }
  }

  void onChangedClassName(String text) {
    final oldValue = this.settings.className;
    final newValue = this.classNameController.text;
    if (oldValue != newValue) {
      app.activeSession.pGenerateModelSettings.updateValue.className = newValue;
    }
  }

  void onCustomSuperClassChanged(String newValue) {
    final oldValue = this.settings.superClassName;
    if (oldValue != newValue) {
      app.activeSession.pGenerateModelSettings.updateValue.superClassName = newValue;
    }
  }

  void onKeyStyleChanged(StringCaseType? newValue) {
    final oldValue = this.settings.keyStringCase;
    if (oldValue != newValue) {
      app.activeSession.pGenerateModelSettings.updateValue.keyStringCase = newValue;
    }
  }

  void onSuperClassChanged(SuperClassType? newValue) {
    final oldValue =
        SuperClassType.values.valueOf(this.settings.superClassName) ?? SuperClassType.NONE;
    if (oldValue != newValue) {
      app.activeSession.pGenerateModelSettings.updateValue.superClassName = newValue?.name;
    }
  }

  void onTemplatesDirPathChanged(String newValue) {
    final oldValue = this.cache.templatesDirPath;
    if (oldValue != newValue) {
      app.activeSession.pCache.updateValue.templatesDirPath = newValue;
      this.syncTemplateNamesDebouncer.call();
    }
  }

  void onModelTemplateFileNameChanged(String newValue) {
    final oldValue = this.settings.modelTemplateFileName;
    if (oldValue != newValue) {
      app.activeSession.pGenerateModelSettings.updateValue.modelTemplateFileName = newValue;
    }
  }

  void onExportsTemplateFileNameChanged(String newValue) {
    final oldValue = this.settings.exportsTemplateFileName;
    if (oldValue != newValue) {
      app.activeSession.pGenerateModelSettings.updateValue.exportsTemplateFileName = newValue;
    }
  }

  void onIncludeIdChanged(bool? newValue) {
    final oldValue = this.settings.includeId;
    if (oldValue != newValue) {
      app.activeSession.pGenerateModelSettings.updateValue.includeId = newValue;
    }
  }

  void onIncludeArgsChanged(bool? newValue) {
    final oldValue = this.settings.includeArgs;
    if (oldValue != newValue) {
      app.activeSession.pGenerateModelSettings.updateValue.includeArgs = newValue;
    }
  }

  //
  //
  //

  void onChangedFieldName(int fieldIndex, String? value) {
    final contains = this.fieldNames.contains(value);
    final fieldEntry = app.activeSession.pGenerateModelSettings.value.fieldEntries![fieldIndex];
    final custom = fieldEntry.isCustomFieldName != false || !contains;
    app.activeSession.pGenerateModelSettings.value.fieldEntries![fieldIndex].isCustomFieldName =
        custom;
    if (!custom) {
      value = contains ? (value ?? this.fieldNames.first) : this.fieldNames.first;
    }
    app.activeSession.pGenerateModelSettings.updateValue.fieldEntries![fieldIndex].fieldName =
        value;
  }

  //
  //
  //

  void onChangedFieldType(int fieldIndex, String? value) {
    final contains = this.fieldNames.contains(value);
    final fieldEntry = app.activeSession.pGenerateModelSettings.value.fieldEntries![fieldIndex];
    final custom = fieldEntry.isCustomFieldName != false || !contains;
    app.activeSession.pGenerateModelSettings.value.fieldEntries![fieldIndex].isCustomFieldType =
        custom;
    if (!custom) {
      value = contains ? (value ?? this.fieldNames.first) : this.fieldNames.first;
    }
    app.activeSession.pGenerateModelSettings.updateValue.fieldEntries![fieldIndex].fieldType =
        value;
  }

  //
  //
  //

  void onToggleFieldNameInput(int fieldIndex) {
    final a = app.activeSession.pGenerateModelSettings.value.fieldEntries![fieldIndex];
    final custom = a.isCustomFieldName != false;
    app.activeSession.pGenerateModelSettings.updateValue.fieldEntries![fieldIndex]
        .isCustomFieldName = !custom;
  }

  //
  //
  //

  void onToggleFieldTypeInput(int fieldIndex) {
    final a = app.activeSession.pGenerateModelSettings.value.fieldEntries![fieldIndex];
    final custom = a.isCustomFieldType != false;
    app.activeSession.pGenerateModelSettings.updateValue.fieldEntries![fieldIndex]
        .isCustomFieldType = !custom;
  }

  //
  //
  //

  void onChangedNullable(int fieldIndex, bool? value) {
    app.activeSession.pGenerateModelSettings.updateValue.fieldEntries![fieldIndex].isNullable =
        value;
  }

  //
  //
  //

  void addFieldEntry() {
    final fieldEntry = defaultModelFieldEntry().copyWith<ModelFieldEntry>(
      ModelFieldEntry(
        fieldName: this.fieldNames.first,
        fieldType: this.fieldTypes.first,
      ),
    );
    app.activeSession.pGenerateModelSettings.updateValue.fieldEntries = [
      fieldEntry,
      ...?app.activeSession.pGenerateModelSettings.value.fieldEntries,
    ];
  }

  //
  //
  //

  void deleteFieldEntry(int index) {
    app.activeSession.pGenerateModelSettings.updateValue.fieldEntries?.removeAt(index);
  }

  //
  //
  //

  List<String> get fieldTypes => [
        'String',
        'bool',
        'DateTime',
        'double',
        'Duration',
        'int',
        'List<ModelEvent>',
        'List<ModelRelationship>',
        'LowerCase-String',
        'LowerDotCase-String',
        'LowerKebabCase-String',
        'Map<String, DateTime>',
        'ModelUser',
        'Queue<ModelUserPub>',
        'Set<String>',
        'UpperCase-String',
      ];

  //
  //
  //

  List<String> get fieldNames => [
        'email',
        'id',
        'display_name',
        'events',
        'first_name',
        'last_name',
        'relationships',
        'user_id',
        'user_pub_id',
        'when_created',
      ].map((e) => this.settings.getKeyStringCase().convertString(e)).toList();

  //
  //
  //

  void onOutputDirPathChanged(String text) {
    final oldValue = this.settings.outputDirPath;
    final newValue = this.outputDirPathController.text;
    if (oldValue != newValue) {
      app.activeSession.pGenerateModelSettings.updateValue.outputDirPath = newValue;
    }
  }

  //
  //
  //

  void onChangedDartSdkPath(String text) {
    final oldValue = this.cache.dartSdkPath;
    final newValue = this.dartSdkPathController.text;
    if (oldValue != newValue) {
      app.activeSession.pCache.updateValue.dartSdkPath = newValue;
    }
  }

  //
  //
  //

  void onChangedDirectives(String text) {
    final oldValue = this.settings.directives;
    final newValue = this.directivesController.text.split('\n');
    if (oldValue != newValue) {
      app.activeSession.pGenerateModelSettings.updateValue.directives = newValue;
    }
  }

  //
  //
  //

  // ---------------------------------------------------------------------------

  //
  //
  //

  Future<void> generateModelDirectly() async {
    this._validateFieldEntries();
    await writeFile(
      this.settings.getModelFilePath(),
      createAnnotatedClassFileContent(
        this.settings,
      ),
    );
    final annotation = GenerateModel(
      className: this.settings.getClassName(),
      fields: this
          .settings
          .getFieldEntries()
          .map((e) {
            return MapEntry(
              e.fieldName,
              "${e.fieldType}${e.isNullable ?? defaultModelFieldEntry().isNullable! ? '?' : ''}",
            );
          })
          .toMap()
          .nonNulls,
      inheritanceConstructor: this.settings.getInheritanceConstructor(),
      shouldInherit: this.settings.getShouldInheret(),
      keyStringCase: this.settings.getKeyStringCase().name,
      includeId: this.settings.getIncludeId(),
      includeArgs: this.settings.getIncludeArgs(),
    );

    await generateModel(
      inputFilePath: this.settings.getModelFilePath(),
      templates: {
        'first': (await readSnippetsFromMarkdownFile(
          this.settings.getModelTemplateFilePath(
                this.cache.getTemplatesDirPath(),
              ),
        ))
            .first,
      },
      annotation: annotation,
      annotatedClassName: '_${annotation.className!}',
    );
    await generateExports(
      rootDirPaths: {settings.getOutputDirPath()},
      templateFilePath: settings.getExportsTemplateFilePath(this.cache.getTemplatesDirPath()),
    );
    await fixDartFile(settings.getModelFilePath());
    await fmtDartFile(settings.getModelFilePath());
  }

  //
  //
  //

  Future<void> generateModelWithAnalysis() async {
    this._validateFieldEntries();
    final receivePort = ReceivePort();
    final message = {
      'sendPort': receivePort.sendPort,
      ModelGenerateModelSettings.CLASS: this.settings.toJsonString(),
      ModelCache.CLASS: this.cache.toJsonString(),
    };
    final isolate = await Isolate.spawn(
      (Map<String, dynamic> message) async {
        final sendPort = message['sendPort'] as SendPort;

        final isolatedSettings = ModelGenerateModelSettings.fromJsonString(
          message[ModelGenerateModelSettings.CLASS],
        );
        final isolatedCache = ModelCache.fromJsonString(message[ModelCache.CLASS]);
        try {
          await writeFile(
            isolatedSettings.getModelFilePath(),
            createAnnotatedClassFileContent(isolatedSettings),
          );
          await generateModels(
            fallbackDartSdkPath: isolatedCache.getDartSdkPath(),
            rootDirPaths: {isolatedSettings.getOutputDirPath()},
            subDirPaths: {isolatedSettings.getModelFolderName()},
            templateFilePath: isolatedSettings.getModelTemplateFilePath(
              isolatedCache.getTemplatesDirPath(),
            ),
          );
          await generateExports(
            rootDirPaths: {isolatedSettings.getOutputDirPath()},
            templateFilePath: isolatedSettings.getExportsTemplateFilePath(
              isolatedCache.getTemplatesDirPath(),
            ),
          );
          await fixDartFile(isolatedSettings.getModelFilePath());
          await fmtDartFile(isolatedSettings.getModelFilePath());
          sendPort.send({'status': 'done'});
        } catch (e) {
          sendPort.send({'status': 'error', 'e': e});
        }
      },
      message,
    );
    final result = await receivePort.first;
    isolate.kill();
    if (result['status'] == 'error') {
      final e = result['e'];
      throw e;
    }
  }

  //
  //
  //

  void _validateFieldEntries() {
    if (this.settings.fieldEntries!.map((e) => e.fieldName).toSet().length !=
        this.settings.fieldEntries!.length) {
      throw 'Duplicate keys found in field entries! Go back to Step 2 and fix this, then try again.';
    }
    if (this.settings.fieldEntries!.isEmpty) {
      throw 'No fields found! Did you forget to add fields in Step 2?';
    }
  }
}
