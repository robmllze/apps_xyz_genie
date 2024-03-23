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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class GenerateModelPage1 extends ScreenPage {
  //
  //
  //

  const GenerateModelPage1({
    super.key,
    required super.screenState,
  }) : super(title: 'Step 1 - Template');

  //
  //
  //

  @override
  State<GenerateModelPage1> createState() => _View();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _View extends TGenerateModelScreenPageView<GenerateModelPage1> {
  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return PodBuilder(
      pod: app.activeSession.pGenerateModelSettings,
      builder: (context, child, settings) {
        return WColumn(
          divider: const Divider(),
          children: [
            MyTbFormItem(
              title: 'Model Class Name',
              subtitle:
                  'What would you like to call your model class? You can also open an existing model with Dart Analysis.',
              child: MyPathInputField(
                controller: this.c.classNameController,
                onChanged: this.c.onChangedClassName,
                onPicked: this._onPickModelFolder,
              ),
            ),
            MyTbFormItem(
              title: 'Key Style',
              subtitle:
                  'Which style would you like to use for your field keys?',
              child: MyDropdownTextField<StringCaseType>(
                initialValue:
                    settings.keyStringCase ?? StringCaseType.LOWER_SNAKE_CASE,
                dropdownOptions: StringCaseType.values,
                initialInputMethod: MyDropdownTextFieldMethod.DROPDOWN,
                canChangeInputMethod: false,
                onValueChanged: this.c.onKeyStyleChanged,
                valueToString: (e) => e.message,
                stringToValue: (e) => StringCaseType.values.valueOf(e),
              ),
            ),
            () {
              final dropdownOptions = [
                'ThisModel<${settings.className}>',
                'Model',
                'None',
              ];
              return MyTbFormItem(
                title: 'Super Class',
                subtitle: 'Which superclass should your model inherit from?',
                child: MyDropdownTextField(
                  initialValue: settings.superClassName,
                  dropdownOptions: dropdownOptions,
                  initialInputMethod:
                      dropdownOptions.contains(settings.superClassName)
                          ? MyDropdownTextFieldMethod.DROPDOWN
                          : MyDropdownTextFieldMethod.TEXT,
                  onValueChanged: (v) =>
                      app.activeSession.pGenerateModelSettings.update((e) {
                    return e
                      ..superClassName = v
                      ..shouldInheret = v != dropdownOptions.last;
                  }),
                ),
              );
            }(),
            MyTbFormItem(
              title: 'Templates Dir Path',
              subtitle: 'Where is your templates/ folder?',
              child: MyPathInputField(
                onChanged: this.c.onTemplatesDirPathChanged,
                controller: this.c.templatesDirPathController,
              ),
            ),
            MyTbFormItem(
              title: 'Model Template',
              subtitle: 'Which model template would you like to use?',
              child: PodBuilder(
                pod: this.c.pModelTemplatePaths,
                builder: (context, child, value) {
                  return MyDropdownTextField.dropdown(
                    initialValue: this.c.settings.getModelTemplateFileName(),
                    dropdownOptions: {
                      ...value,
                      this.c.settings.getModelTemplateFileName(),
                    }.toList(),
                    onValueChanged: (v) => app
                        .activeSession.pGenerateModelSettings
                        .update((e) => e..modelTemplateFileName = v),
                  );
                },
              ),
            ),
            MyTbFormItem(
              title: 'Exports Template',
              subtitle: 'Which exports template would you like to use?',
              child: PodBuilder(
                pod: this.c.pExportsTemplatePaths,
                builder: (context, child, value) {
                  return MyDropdownTextField.dropdown(
                    initialValue: this.c.settings.getExportsTemplateFileName(),
                    dropdownOptions: {
                      ...value,
                      this.c.settings.getExportsTemplateFileName(),
                    }.toList(),
                    onValueChanged: (v) => app
                        .activeSession.pGenerateModelSettings
                        .update((e) => e..exportsTemplateFileName = v),
                  );
                },
              ),
            ),
            MyLrFormItem(
              title: 'Include ID',
              subtitle: 'Should the default `id` field be included?',
              child: SwitchListTile(
                value: settings.includeId ?? const GenerateModel().includeId,
                onChanged: this.c.onIncludeIdChanged,
              ),
            ),
            MyLrFormItem(
              title: 'Include Args',
              subtitle: 'Should the default `args` field be included?',
              child: SwitchListTile(
                value:
                    settings.includeArgs ?? const GenerateModel().includeArgs,
                onChanged: this.c.onIncludeArgsChanged,
              ),
            ),
          ],
        );
      },
    );
  }

  //
  //
  //

  void _onPickModelFolder(String modelDirPath) {
    showMessageOverlayWithErrorHandler(
      context,
      remover: (remove) async {
        final updatedSettings = await loadGenerateModelSettingsFromFile(
          modelDirPath: modelDirPath,
          dartSdkPath: this.c.cache.getDartSdkPath(),
        );
        if (updatedSettings != null) {
          app.activeSession.pGenerateModelSettings
              .update((oldValue) => oldValue.copyWith(updatedSettings));
        }
        this.c.refreshTextControllers();
        remove();
      },
      title: 'Opening Model with Dart Analysis...',
      message:
          'Please wait while your model is opening with Dart Analysis. This usually takes around 20-30 seconds.',
      trailing: const LinearProgressIndicator(),
    );
  }
}
