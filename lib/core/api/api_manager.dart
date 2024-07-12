import 'package:dio/dio.dart';

import '../utils/constants.dart';

class ApiManager {
  Dio dio = Dio();

  Future<Response> getData(String endPoint, {Map<String, dynamic>? data}) {
    return dio.get(Constants.basURl + endPoint, queryParameters: data);
  }

  Future<Response> postData(String endPoint, {Map<String, dynamic>? body}) {
    return dio.post(Constants.basURl + endPoint, data: body);
  }

  Future<Response> deleteData(String endPoint, {Map<String, dynamic>? data}) {
    final options = Options(headers: data);

    return dio.delete(Constants.basURl + endPoint, options: options);
  }
}
