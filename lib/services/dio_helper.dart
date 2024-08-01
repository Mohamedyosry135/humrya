import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../consts/storage.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'http://cpanel.hcsc.ae/api/v1/',
          receiveDataWhenStatusError: true,
          connectTimeout: 30000,
          receiveTimeout: 30000),
    );
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      String? token,
      Options? options}) async {
    print(token);
    dio.options.headers = {
      'Authorization': 'Bearer ${GetStorage().read(StorageKeys.token)}',
      'Content-Type': 'application/json',
    };
    return await dio.get(url, queryParameters: query, options: options);
  }

  static Future<Response> downloadFile(
      {required String url,
      Map<String, dynamic>? query,
      required String? token,
      required String? fileName}) async {
    print(token);
    dio.options.headers = {
      'Authorization': 'Bearer ${GetStorage().read(StorageKeys.token)}',
      'Content-Type': 'application/json',
    };
    return await dio.downloadUri(
        Uri.parse(url), '/storage/emulated/0/Download/$fileName.pdf',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }));
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      String? token,
      data}) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${GetStorage().read(StorageKeys.token)}',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    return await dio.post(url, queryParameters: query, data: data);
  }
  static Future<Response> deleteData(
      {required String url,
        Map<String, dynamic>? query,
        String? token,
        data}) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${GetStorage().read(StorageKeys.token)}',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    return await dio.delete(url, queryParameters: query, data: data);
  }
  // static Future<Response> postDataDynamic(
  //     {required String url, Map<String, dynamic>? query, String? token,data}) async {
  //   dio.options.headers = {
  //     'Authorization': 'Bearer $token',
  //     'Content-Type': 'application/json',
  //
  //   };
  //   return await dio.post(url, queryParameters: query,data: data);
  // }
}
