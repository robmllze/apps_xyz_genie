//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED BY 🇽🇾🇿 GEN - DO NOT MODIFY BY HAND
// See: https://github.com/robmllze/xyz_gen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

part of 'generate_screen_screen.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT = false;
const _IS_REDIRECTABLE = true;

const _CLASS = 'GenerateScreenScreen';
const _SEGMENT = 'generate_screen';
const _PATH = '/$_SEGMENT';
const _TR_KEY = 'screens.GenerateScreenScreen';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension _ScreenTr on String {
  // ignore: unused_element
  String screenTr({Map<dynamic, dynamic> args = const {}}) {
    return GenerateScreenScreenConfiguration.screenTr(this, args: args);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Screen? makerGenerateScreenScreen(
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
  if (configuration is GenerateScreenScreenConfiguration) {
    return GenerateScreenScreen(
      key: ValueKey<String?>(configuration.path),
      configuration: configuration,
    );
  }
  if (RegExp(r'^(' + _PATH + r')([?/].*)?$')
      .hasMatch(Uri.decodeComponent(configuration.path ?? ''))) {
    final temp = GenerateScreenScreenConfiguration(
      $arguments: configuration.arguments,
    );
    return GenerateScreenScreen(
      key: ValueKey<String?>(temp.path),
      configuration: temp,
    );
  }
  return null;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class GenerateScreenScreenConfiguration extends ModelScreenConfiguration {
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
  static String get translatedTitle => screenTr('Generate Screen||title');
  // ignore: prefer_const_declarations
  static final ScreenMakeup? screenMakeup = null;
  static String screenTr(String key, {Map<dynamic, dynamic> args = const {}}) {
    return key.splitByLastOccurrenceOf('||').join('||$_TR_KEY.').tr(args: args);
  }

  GenerateScreenScreenConfiguration({
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

  GenerateScreenScreenConfiguration.fromArgs(Map<dynamic, dynamic>? args)
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

abstract class _ControllerBroker<T1 extends GenerateScreenScreen,
        T2 extends _View>
    extends ScreenController<GenerateScreenScreenConfiguration> {
  late final screen = super.superScreen as T1;
  late final state = super.superState as T2;
  late final configuration = GenerateScreenScreenConfiguration.fromArgs(
    screen.configuration?.arguments ?? {},
  );

  _ControllerBroker(super.superScreen, super.superState);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final generatedGenerateScreenScreenRoute = GoRoute(
  path: _SEGMENT,
  pageBuilder: (_, GoRouterState state) {
    final extraConfiguration = letAs<ModelScreenConfiguration>(state.extra);
    final urlConfiguration = urlToScreenConfiguration(
      url: state.uri,
      isAccessibleOnlyIfLoggedIn:
          GenerateScreenScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
      isAccessibleOnlyIfLoggedInAndVerified: GenerateScreenScreenConfiguration
          .IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
      isAccessibleOnlyIfLoggedOut:
          GenerateScreenScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
      isRedirectable: GenerateScreenScreenConfiguration.IS_REDIRECTABLE,
      makeup: GenerateScreenScreenConfiguration.screenMakeup,
      navigationControlsWidget:
          GenerateScreenScreenConfiguration.NAVIGATION_CONTROLS_WIDGET,
      title: GenerateScreenScreenConfiguration.translatedTitle,
    );
    final configuration = extraConfiguration ?? urlConfiguration;
    return NoTransitionPage(
      key: state.pageKey,
      child: GenerateScreenScreen(
        key: ValueKey<String?>(configuration.path),
        configuration: configuration,
      ),
    );
  },
);

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef TGenerateScreenScreenController
    = _ControllerBroker<GenerateScreenScreen, _View>;

typedef TGenerateScreenScreenView = ScreenView<GenerateScreenScreen,
    GenerateScreenScreenConfiguration, GenerateScreenScreenController>;

typedef TGenerateScreenScreenPageView<T extends ScreenPage> = ScreenPageView<T,
    GenerateScreenScreenConfiguration, GenerateScreenScreenController>;