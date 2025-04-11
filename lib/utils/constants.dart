import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_app/app_config.dart';
import 'package:flutter_ecommerce_app/data/local/env_key.dart';

class Constants {
  final String endpoint;
  const Constants._({required this.endpoint});

  factory Constants.of() {
    final flavor = Flavor.values.firstWhere(
      (element) => element.name == AppConfig.flavor,
    );

    switch (flavor) {
      case Flavor.dev:
        return Constants._dev();
      case Flavor.stg:
        return Constants._stg();
      case Flavor.prod:
        return Constants._prd();
    }
  }

  factory Constants._dev() {
    return Constants._(endpoint: EnvKey.devApiUrl.read());
  }

  factory Constants._stg() {
    return Constants._(endpoint: EnvKey.stgApiUrl.read());
  }

  factory Constants._prd() {
    return Constants._(endpoint: EnvKey.prodApiUrl.read());
  }

  static const platformChannel = MethodChannel("native-channel");
  static const getFlavor = "GET_FLAVOR";

  // ignore: constant_identifier_names
  static const METHOD_LISTEN_ON_FOCUS_CHANGE = "ANDROID_ON_WINDOW_FOCUS_CHANGE";

  static const expiredError = 403;
  static const expiredTokenError = 404;

  static const expiredErrorMessage = 'Operation not permitted';
  static const expiredTokenErrorMessage = 'The provided ID token is invalid';
  static const paymentNotOwner = 'This payment was made by another user.';
  static const sendVerifyMailTooManyRequest = 'TOO_MANY_ATTEMPTS_TRY_LATER.';

  // Url
  static const urlAppleSupport = "https://www.apple.com/support/itunes/ww/";
  static const urlAppleInquirySupport = "https://getsupport.apple.com/";
}
