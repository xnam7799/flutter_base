import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_app/utils/constants.dart';

typedef MultiUseCallback = void Function(dynamic msg);
typedef CancelListening = void Function();

Map<String, MultiUseCallback> _callbacksById =
    <String, void Function(dynamic)>{};

Future<void> _methodCallHandler(MethodCall call) async {
  switch (call.method) {
    case Constants.METHOD_LISTEN_ON_FOCUS_CHANGE:
      var hasFocus = call.arguments["hasFocus"];
      _callbacksById["onWindowFocusChange"]!(hasFocus);
      break;
    default:
      print('Ignoring invoke from native. This normally shouldn\'t happen.');
  }
}

Future<CancelListening> startListening(
  MultiUseCallback callback,
  String callbackName,
) async {
  Constants.platformChannel.setMethodCallHandler(_methodCallHandler);

  _callbacksById[callbackName] = callback;
  return () {
    _callbacksById.remove(callbackName);
  };
}
