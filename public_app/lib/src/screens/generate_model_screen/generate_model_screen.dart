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

import 'dart:isolate';

import 'package:path/path.dart' as p;

import '/_common.dart';

import 'pages/_generate_model_page1.dart';
import 'pages/_generate_model_page2.dart';
import 'pages/_generate_model_page3.dart';

part '_controller.dart';
part '_view.dart';
part '_bindings.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateScreenBindings(
  defaultTitle: 'Generate Model',
  isRedirectable: true,
)
class GenerateModelScreen extends Screen {
  //
  //
  //

  const GenerateModelScreen({
    super.key,
    super.configuration,
    super.controllerCacheTimeout = null,
  });

  //
  //
  //

  @override
  _View createState() => _View();

  //
  //
  //

  @override
  GenerateModelScreenController createController(
    Screen screen,
    ScreenView state,
  ) {
    return GenerateModelScreenController(screen, state);
  }
}
