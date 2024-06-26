//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED BY 🇽🇾🇿 GEN - DO NOT MODIFY BY HAND
// See: https://github.com/robmllze/xyz_gen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

part of 'generate_model_screen.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT = false;
const _IS_REDIRECTABLE = true;

const _CLASS = 'GenerateModelScreen';
const _SEGMENT = 'generate_model';
const _PATH = '/$_SEGMENT';
const _TR_KEY = 'screens.GenerateModelScreen';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension _ScreenTr on String {
  // ignore: unused_element
  String screenTr({Map<dynamic, dynamic> args = const {}}) {
    return GenerateModelScreenConfiguration.screenTr(this, args: args);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Screen? makerGenerateModelScreen(
  ModelScreenConfiguration configuration,
  bool isLoggedInAndVerified,
  bool isLoggedIn,
  bool isLoggedOut,
) {
  if ((_IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED &&
          !isLoggedInAndVerified) ||
      (_IS_ACCESSIBLE_ONLY_IF_LOGGED_IN && !isLoggedIn) ||
      (_IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT && !isLoggedOut)) {
    return null;
  }
  if (configuration is GenerateModelScreenConfiguration) {
    return GenerateModelScreen(
      key: ValueKey<String?>(configuration.path),
      configuration: configuration,
    );
  }
  if (RegExp(r'^(' + _PATH + r')([?/].*)?$')
      .hasMatch(Uri.decodeComponent(configuration.path ?? ''))) {
    final temp = GenerateModelScreenConfiguration(
      $arguments: configuration.arguments,
    );
    return GenerateModelScreen(
      key: ValueKey<String?>(temp.path),
      configuration: temp,
    );
  }
  return null;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class GenerateModelScreenConfiguration extends ModelScreenConfiguration {
  static const CLASS = _CLASS;
  static const SEGMENT = _SEGMENT;
  static const PATH = _PATH;
  static const TR_KEY = _TR_KEY;
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_IN =
      _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN;
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED =
      _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED;
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT =
      _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT;
  static const IS_REDIRECTABLE = _IS_REDIRECTABLE;
  static const NAVIGATION_CONTROLS_WIDGET = null;
  static String get translatedTitle => screenTr('Generate Model||title');
  // ignore: prefer_const_declarations
  static final ScreenMakeup? screenMakeup = null;
  static String screenTr(String key, {Map<dynamic, dynamic> args = const {}}) {
    return key.splitByLastOccurrenceOf('||').join('||$_TR_KEY.').tr(args: args);
  }

  GenerateModelScreenConfiguration({
    Map<dynamic, dynamic>? $arguments,
  }) : super(
          path: _PATH,
          arguments: {
            ...?$arguments,
          },
          isAccessibleOnlyIfLoggedInAndVerified:
              _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
          isAccessibleOnlyIfLoggedIn: _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
          isAccessibleOnlyIfLoggedOut: _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
          isRedirectable: _IS_REDIRECTABLE,
        ) {
    super.navigationControlsWidget = NAVIGATION_CONTROLS_WIDGET;
    super.title = translatedTitle;
    super.makeup = screenMakeup;
  }

  GenerateModelScreenConfiguration.fromArgs(Map<dynamic, dynamic>? args)
      : super(
          path: _PATH,
          arguments: args,
          isAccessibleOnlyIfLoggedInAndVerified:
              _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
          isAccessibleOnlyIfLoggedIn: _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
          isAccessibleOnlyIfLoggedOut: _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
          isRedirectable: _IS_REDIRECTABLE,
        ) {
    super.navigationControlsWidget = NAVIGATION_CONTROLS_WIDGET;
    super.title = translatedTitle;
    super.makeup = screenMakeup;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class _ControllerBroker<T1 extends GenerateModelScreen,
        T2 extends _View>
    extends ScreenController<GenerateModelScreenConfiguration> {
  late final screen = super.superScreen as T1;
  late final state = super.superState as T2;
  late final configuration = GenerateModelScreenConfiguration.fromArgs(
    screen.configuration?.arguments ?? {},
  );

  _ControllerBroker(super.superScreen, super.superState);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final generatedGenerateModelScreenRoute = GoRoute(
  path: _SEGMENT,
  pageBuilder: (_, GoRouterState state) {
    final extraConfiguration = letAs<ModelScreenConfiguration>(state.extra);
    final urlConfiguration = urlToScreenConfiguration(
      url: state.uri,
      isAccessibleOnlyIfLoggedIn:
          GenerateModelScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
      isAccessibleOnlyIfLoggedInAndVerified: GenerateModelScreenConfiguration
          .IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
      isAccessibleOnlyIfLoggedOut:
          GenerateModelScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
      isRedirectable: GenerateModelScreenConfiguration.IS_REDIRECTABLE,
      makeup: GenerateModelScreenConfiguration.screenMakeup,
      navigationControlsWidget:
          GenerateModelScreenConfiguration.NAVIGATION_CONTROLS_WIDGET,
      title: GenerateModelScreenConfiguration.translatedTitle,
    );
    final configuration = extraConfiguration ?? urlConfiguration;
    return NoTransitionPage(
      key: state.pageKey,
      child: GenerateModelScreen(
        key: ValueKey<String?>(configuration.path),
        configuration: configuration,
      ),
    );
  },
);

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef TGenerateModelScreenController
    = _ControllerBroker<GenerateModelScreen, _View>;

typedef TGenerateModelScreenView = ScreenView<GenerateModelScreen,
    GenerateModelScreenConfiguration, GenerateModelScreenController>;

typedef TGenerateModelScreenPageView<T extends ScreenPage> = ScreenPageView<T,
    GenerateModelScreenConfiguration, GenerateModelScreenController>;
