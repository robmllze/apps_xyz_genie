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

class GenerateModelPage3 extends ScreenPage {
  //
  //
  //

  const GenerateModelPage3({
    super.key,
    required super.screenState,
  }) : super(title: 'Step 3 - Generate');

  //
  //
  //

  @override
  State<GenerateModelPage3> createState() => _View();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _View extends TGenerateModelScreenPageView<GenerateModelPage3> {
  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return WColumn(
      divider: const Divider(),
      children: [
        MyTbFormItem(
          title: 'Dart SDK Path',
          subtitle: 'What is your Dart SDK path?',
          child: TextField(
            enabled: false,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(20.0),
            ),
            controller: this.c.dartSdkPathController,
            onChanged: this.c.onChangedDartSdkPath,
          ),
        ),
        MyTbFormItem(
          title: 'Directives',
          subtitle:
              'Which lines of code should be included at the top of the generated file?',
          child: TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(20.0),
            ),
            minLines: 3,
            maxLines: 10,
            controller: this.c.directivesController,
            onChanged: this.c.onChangedDirectives,
          ),
        ),
        MyTbFormItem(
          title: 'Output Path',
          subtitle: 'Where is your /models folder path?',
          child: MyPathInputField(
            controller: this.c.outputDirPathController,
            onChanged: this.c.onOutputDirPathChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Note: This tool is intended to help you get started and save time. Please review the generated code and manually fix any issues before use.',
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontSize: 16.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              const Spacer(),
              FilledButton.icon(
                onPressed: () => this._onTapGenerateWithAnalysis(context),
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    Theme.of(context).textTheme.titleMedium,
                  ),
                  padding:
                      MaterialStateProperty.all(const EdgeInsets.all(20.0)),
                ),
                icon: const Icon(FluentIcons.play_circle_48_regular),
                label: const Text('Generate with Dart Analysis'),
              ),
              const SizedBox(width: 12.0),
              FilledButton.icon(
                onPressed: () => this._onTapGenerate(context),
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    Theme.of(context).textTheme.titleMedium,
                  ),
                  padding:
                      MaterialStateProperty.all(const EdgeInsets.all(20.0)),
                ),
                icon: const Icon(FluentIcons.play_circle_48_regular),
                label: const Text('Generate'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //
  //
  //

  void _onTapGenerateWithAnalysis(BuildContext context) {
    showMessageOverlayWithErrorHandler(
      context,
      remover: (r1) async {
        await this.c.generateModelWithAnalysis();
        r1();
        VoidCallback? r2;
        if (context.mounted) {
          showMessageOverlay(
            context,
            title: 'Done!',
            titleIcon: const Icon(FluentIcons.checkmark_24_regular),
            message:
                'Your model has been generated and saved to:\n\n${this.c.settings.getModelFilePath()}.',
            tapBackgroundToDismiss: true,
            remover: (r) => r2 = r,
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => r2!(),
                  child: const Text('Close'),
                ),
              ],
            ),
          );
        }
      },
      title: 'Generating Model with Dart Analysis...',
      message:
          'Please wait while your model is generated with Dart Analysis. This usually takes around 20-30 seconds.',
      trailing: const LinearProgressIndicator(),
    );
  }

  //
  //
  //

  void _onTapGenerate(BuildContext context) {
    showMessageOverlayWithErrorHandler(
      context,
      remover: (r1) async {
        await this.c.generateModelDirectly();
        r1();
        if (context.mounted) {
          VoidCallback? r2;
          showMessageOverlay(
            context,
            title: 'Done!',
            titleIcon: const Icon(FluentIcons.checkmark_24_regular),
            message:
                'Your model has been generated and saved to:\n\n${this.c.settings.getModelFilePath()}.',
            tapBackgroundToDismiss: true,
            remover: (r) => r2 = r,
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => r2!(),
                  child: const Text('Close'),
                ),
              ],
            ),
          );
        }
      },
      title: 'Generating Model...',
      message:
          'Please wait while your model is generated. This usually takes under 5 seconds.',
      trailing: const LinearProgressIndicator(),
    );
  }
}
