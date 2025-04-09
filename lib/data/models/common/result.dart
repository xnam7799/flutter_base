import 'dart:io';

import 'package:flutter_ecommerce_app/data/remote/app_error.dart';
import 'package:flutter_ecommerce_app/view_models/common/error_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const Result._();

  const factory Result.success({required T data}) = Success<T>;

  const factory Result.failure({required AppError error}) = Failure<T>;

  static Result<T> guard<T>(T Function() body, [ErrorHandler? errorHandler]) {
    try {
      return Result.success(data: body());
    } on Exception catch (e) {
      final appError = AppError(e);
      // listen and handle the error for app
      if (errorHandler != null) {
        errorHandler.setError(appError);
      }
      return Result.failure(error: appError);
    }
  }

  static Future<Result<T>> guardFuture<T>(
    Future<T> Function() future, [
    ErrorHandler? errorHandler,
  ]) async {
    try {
      return Result.success(data: await future());
    } on Exception catch (error, stackTrace) {
      final appError = AppError(error);
      // listen and handle the error for app
      if (errorHandler != null) {
        errorHandler.setError(appError);
      }
      // FirebaseCrashlytics.instance.recordError(
      //   Exception(
      //     "${Platform.isAndroid ? "Android" : "IOS"} - Throw Exception API, $error",
      //   ),
      //   stackTrace,
      //   reason: 'as an fatal error',
      //   fatal: true,
      // );
      return Result.failure(error: appError);
    }
  }

  // bool get isSuccess => when(success: (data) => true, failure: (e) => false);

  // bool get isFailure => !isSuccess;

  // void ifSuccess(Function(T data) body) {
  //   maybeWhen(
  //     success: (data) => body(data),
  //     orElse: () {
  //       // no-op
  //     },
  //   );
  // }

  // void ifFailure(Function(AppError e) body) {
  //   maybeWhen(
  //     failure: (e) => body(e),
  //     orElse: () {
  //       // no-op
  //     },
  //   );
  // }

  // T get dataOrThrow {
  //   return when(success: (data) => data, failure: (e) => throw e);
  // }
}

extension ResultObjectExt<T> on T {
  Result<T> get asSuccess => Result.success(data: this);

  Result<T> asFailure(Exception e) => Result.failure(error: AppError(e));
}
