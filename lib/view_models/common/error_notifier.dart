import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce_app/data/remote/app_error.dart';

class ErrorHandler extends ChangeNotifier {
  ErrorHandler();

  AppError? _appError;

  get appError => _appError;

  Future<void> setError(AppError appError) async {
    _appError = appError;
    notifyListeners();
  }

  void resetError() {
    _appError = null;
  }
}
