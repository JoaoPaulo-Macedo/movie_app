class AppConfigs {
  AppConfigs._(this.debug, this.environment);

  factory AppConfigs(AppEnvironment environment) {
    if (i == null) {
      switch (environment) {
        case AppEnvironment.dev:
          i = AppConfigs._(true, AppEnvironment.dev);
          break;
        case AppEnvironment.debug:
          i = AppConfigs._(true, AppEnvironment.prod);
          break;
        case AppEnvironment.prod:
          i = AppConfigs._(false, AppEnvironment.prod);
          break;
      }
    }

    return i!;
  }

  /// Global instance of App configurations
  static AppConfigs? i;

  bool debug;
  int debugMaxChars = 200;
  AppEnvironment environment;
}

enum AppEnvironment { dev, debug, prod }
