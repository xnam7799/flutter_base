import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvKey {
  stgApiUrl,
  prodApiUrl,
  devApiUrl,
  applicationKey,
  secretKey,
  basicAuthentication,
}

extension EnvKeyEx on EnvKey {
  String get keyString {
    switch (this) {
      case EnvKey.stgApiUrl:
        return "STG_API_URL";
      case EnvKey.prodApiUrl:
        return "PROD_API_URL";
      case EnvKey.devApiUrl:
        return "DEV_API_URL";
      case EnvKey.applicationKey:
        return "APPLICATION_KEY";
      case EnvKey.secretKey:
        return "SECRET_KEY";
      case EnvKey.basicAuthentication:
        return "BASIC_AUTHENTICATION";
    }
  }

  String read() {
    return dotenv.get(keyString, fallback: "");
  }
}
