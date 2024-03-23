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

class GenerateScreenPage1 extends ScreenPage {
  //
  //
  //

  const GenerateScreenPage1({
    super.key,
    required super.screenState,
  }) : super(title: 'Step 1');

  //
  //
  //

  @override
  State<GenerateScreenPage1> createState() => _View();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _View extends TGenerateScreenScreenPageView<GenerateScreenPage1> {
  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return PodBuilder(
      pod: app.activeSession.pGenerateScreenSettings,
      builder: (context, child, settings) {
        return WColumn(
          divider: const Divider(),
          children: [
            MyTbFormItem(
              title: 'Screen Class Name',
              subtitle:
                  'What would you like to call your screen class? You can also open an existing model with Dart Analysis.',
              child: TextField(
                controller: this.c.classNameController,
                onChanged: this.c.onChangedClassName,
              ),
            ),
            MyTbFormItem(
              title: 'Project Root Dir Path',
              subtitle: 'Where is the root directory of your project?',
              child: MyPathInputField(
                onChanged: (v) {},
              ),
            ),
          ],
        );
      },
    );
  }
}
