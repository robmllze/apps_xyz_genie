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

class AppEnvironment {
  //
  //
  //

  late final RouteManager routeManager;

  final ServiceEnvironment serviceEnvironment;

  AppEnvironment(this.serviceEnvironment);

  //
  //
  //

  AppSession? _activeSession;

  AppSession get activeSession {
    if (this._activeSession == null) {
      throw UnimplementedError(
        'AppSession is not available in the current environment.',
      );
    }
    return this._activeSession!;
  }

  //
  //
  //

  Future<void> initApp(AppSession appSession) async {
    await appSession.startSession();
    this._activeSession = appSession;
    this.routeManager = RouteManager(
      authServiceBroker: null,
      findScreen: findScreenFromConfigurationAndAuthService,
      generatedScreenRoutes: generatedScreenRoutes,
      defaultOnLoginScreenConfiguration: null,
      defaultOnLogoutScreenConfiguration: HomeScreenConfiguration(),
    );
    final targetConfiguration =
        this.routeManager.pScreenBreadcrumbs.value.lastOrNull?.configuration ??
            this.routeManager.defaultOnLogoutScreenConfiguration;
    final targetScreen = findScreenFromConfigurationAndAuthService(
      configuration: targetConfiguration,
      authServiceBroker: null,
    );
    this.routeManager.pScreenBreadcrumbs.set(Queue.of([targetScreen].nonNulls));
    Future.delayed(
      Duration.zero,
      () => this.routeManager.go(targetConfiguration),
    );
  }
}
