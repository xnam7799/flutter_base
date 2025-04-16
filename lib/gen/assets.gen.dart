/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

class $AssetsJsonsGen {
  const $AssetsJsonsGen();

  /// File path: assets/jsons/choose_product_animation.json
  String get chooseProductAnimation =>
      'assets/jsons/choose_product_animation.json';

  /// File path: assets/jsons/order_animation.json
  String get orderAnimation => 'assets/jsons/order_animation.json';

  /// File path: assets/jsons/payment_animation.json
  String get paymentAnimation => 'assets/jsons/payment_animation.json';

  /// File path: assets/jsons/splash_animation.json
  String get splashAnimation => 'assets/jsons/splash_animation.json';

  /// List of all assets
  List<String> get values => [
    chooseProductAnimation,
    orderAnimation,
    paymentAnimation,
    splashAnimation,
  ];
}

class Assets {
  const Assets._();

  static const String aEnvDev = '.env_dev';
  static const String aEnvProd = '.env_prod';
  static const String aEnvStg = '.env_stg';
  static const $AssetsJsonsGen jsons = $AssetsJsonsGen();

  /// List of all assets
  static List<String> get values => [aEnvDev, aEnvProd, aEnvStg];
}
