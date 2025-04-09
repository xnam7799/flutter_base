import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/data/models/common/result.dart';

abstract class ApiClient {
  Future<Result<Map<String, dynamic>>> callGet({required String path});
}
