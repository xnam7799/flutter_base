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
      case Flavor.development:
        return Constants._dev();
      case Flavor.production:
        return Constants._prd();
    }
  }

  factory Constants._dev() {
    return Constants._(endpoint: EnvKey.devApiUrl.read());
  }

  factory Constants._prd() {
    return Constants._(endpoint: EnvKey.prodApiUrl.read());
  }

  static late final Constants instance = Constants.of();

  static const platformChannel = MethodChannel(
    "com.m3.ecommerce/native_channel",
  );
  static const getFlavor = "GET_FLAVOR";

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
