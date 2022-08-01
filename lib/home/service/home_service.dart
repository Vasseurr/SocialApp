import 'dart:convert';

import 'package:dio/dio.dart';
import '../../home/service/base/home_service_base.dart';

class HomeService with HomeServiceBase {
  // final http.Client httpClient;
  final Dio _dio;

  HomeService(this._dio);
}
