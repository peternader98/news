import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'constants.dart';

@lazySingleton
class ApiManager {

  Dio dio = Dio(
    BaseOptions(
        baseUrl: BASEURL,
        headers: {
          'x-api-key' : APIKEY,
        }
    ),
  );

  Future<Response<dynamic>> get(String url) async {
    return await dio.get(url);
  }

  Future<Response<dynamic>> post(String url) async {
    return await dio.post(url);
  }

}