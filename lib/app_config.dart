enum Flavor { dev, stg, prod }

class AppConfig {
  static String flavor = Flavor.dev.name;
  static bool isAppInBackground = false;
}
