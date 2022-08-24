import 'package:dio/dio.dart';
import 'package:lavie/data_layer/dio_helper/end_points.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }



  static Future<dynamic> getData({
    String? url,
    Map<String, dynamic>? query,
    required String token,
  }) async {
    return await dio!.get(
      url!,
      queryParameters: query,
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return await dio!.post(
      url,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio!.put(
      url,
      data: data,
    );
  }

  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio!.patch(
      url,
      data: data,
    );
  }
}
