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

part of 'generate_screen_screen.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class GenerateScreenScreenController extends TGenerateScreenScreenController {
  //
  //
  //

  GenerateScreenScreenController(super.screen, super.state);

  //
  //
  //

  ModelCache get cache => app.activeSession.pCache.value;
  ModelGenerateScreenSettings get settings =>
      app.activeSession.pGenerateScreenSettings.value;

  final classNameController = TextEditingController(text: 'ExampleScreen');

  //
  //
  //

  @override
  void dispose() {
    this.classNameController.dispose();
    super.dispose();
  }

  //
  //
  //

  @override
  void initController() {
    this.refreshTextControllers();
    super.initController();
  }

  //
  //
  //

  void refreshTextControllers() {
    this.classNameController.text = this.settings.className ?? 'ExampleScreen';
  }

  //
  //
  //

  void onChangedClassName(String text) {
    final oldValue = this.settings.className;
    final newValue = this.classNameController.text;
    if (oldValue != newValue) {
      app.activeSession.pGenerateScreenSettings.updateValue.className =
          newValue;
    }
  }
}
