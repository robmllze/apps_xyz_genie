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

class AppSession {
  //
  //
  //

  final pCache = Pod(ModelCache());
  final pGenerateModelSettings = Pod(ModelGenerateModelSettings());
  final pGenerateScreenSettings = Pod(ModelGenerateScreenSettings());

  //
  //
  //

  final ServiceEnvironment serviceEnvironment;

  //
  //
  //

  AppSession(this.serviceEnvironment);

  //
  //
  //

  Future<void> startSession() async {
    // Get the cache model from the database.
    const cacheRef = DataRef(id: '999', tableName: ModelCache.CLASS);
    final genericCacheModel = (await this
        .serviceEnvironment
        .databaseServiceBroker
        .getModel(cacheRef));
    final cache = ModelCache.from(genericCacheModel);
    await this.pCache.set(cache);

    // Add a listener to the cache model that updates the database every time it changes.
    this.pCache.addListener(() {
      Here().debugLogInfo('Saving state to cache...');
      this
          .serviceEnvironment
          .databaseServiceBroker
          .setModel(this.pCache.value, cacheRef);
    });

    // Set generateModelSettings to the cache model's generateModelSettings.
    final generateModelSettings = defaultModelGenerateModelSettings()
        .copyWith(cache.generateModelSettings) as ModelGenerateModelSettings;
    await this.pGenerateModelSettings.set(generateModelSettings);

    // Add a listener to the generateModelSettings that updates the cache model every time it changes.
    this.pGenerateModelSettings.addListener(() {
      this.pCache.update(
            (v) => v..generateModelSettings = this.pGenerateModelSettings.value,
          );
    });

    // Set generateScreenSettings to the cache model's generateScreenSettings.
    final generateScreenSettings = ModelGenerateScreenSettings();
    await this.pGenerateScreenSettings.set(generateScreenSettings);

    // Add a listener to the generateScreenSettings that updates the cache model every time it changes.
    this.pGenerateScreenSettings.addListener(() {
      this.pCache.update(
            (v) =>
                v..generateScreenSettings = this.pGenerateScreenSettings.value,
          );
    });
  }

  //
  //
  //

  Future<void> stopSession() async {
    this.pGenerateModelSettings.dispose();
    this.pCache.dispose();
  }
}
