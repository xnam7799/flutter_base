import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum AppErrorType {
  network,
  badRequest,
  unauthorized,
  cancel,
  timeout,
  server,
  unknown,
  common,
}

class AppError {
  late int statusCode;
  late String message;
  late AppErrorType type;

  factory AppError.newInstance(AppErrorType type) {
    return AppError.m(type);
  }

  factory AppError.newInstanceWithMessage(AppErrorType type, String message) {
    return AppError.n(type, message);
  }

  AppError.m(this.type);

  AppError.n(this.type, this.message);

  AppError(Exception? error) {
    if (error is DioException) {
      debugPrint(
        'AppError(DioException): '
        'type is ${error.type}, message is ${error.message}',
      );
      try {
        statusCode = error.response?.statusCode ?? 0;
        message = error.response?.data['detail'];
      } catch (e) {
        statusCode = 0;
        message = error.message ?? '';
      }

      switch (error.type) {
        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            type = AppErrorType.network;
          } else {
            type = AppErrorType.unknown;
          }
          break;
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          type = AppErrorType.timeout;
          break;
        case DioExceptionType.sendTimeout:
          type = AppErrorType.network;
          break;
        case DioExceptionType.badResponse:
          switch (error.response?.statusCode) {
            case HttpStatus.badRequest:
              type = AppErrorType.badRequest;
              break;
            case HttpStatus.unauthorized:
              type = AppErrorType.unauthorized;
              break;
            case HttpStatus.internalServerError:
            case HttpStatus.badGateway:
            case HttpStatus.serviceUnavailable:
            case HttpStatus.gatewayTimeout:
              type = AppErrorType.server;
              break;
            default:
              type = AppErrorType.unknown;
              break;
          }
          break;
        case DioExceptionType.cancel:
          type = AppErrorType.cancel;
          break;
        case DioExceptionType.badCertificate:
        case DioExceptionType.connectionError:
          type = AppErrorType.network;
          break;
      }
    } else {
      debugPrint('AppError(Unknown): $error');
      type = AppErrorType.unknown;
      statusCode = 0;
      message = 'AppError: $error';
    }
  }
}
