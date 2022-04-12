import 'package:dio/dio.dart';
import 'package:test/Constents/constents_variable.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ConstentsVariable.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response<dynamic>?> getAllData({
    required String method ,
    required Map<String, dynamic>? qurey,
  }) async{
    return await dio?.get(method,queryParameters: qurey );
  }
}
