import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_flutter/utils/token_utils.dart';
import '../bean/base_response.dart';
import '../bean/user_token.dart';
import 'package:flutter/foundation.dart' as foundation;

import '../pages/login/login_pwd_page.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  Dio get dio => _dio;
  late Dio _dio;

  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://127.0.0.1:8090/',//本地部署的地址
        connectTimeout: const Duration(seconds: 50),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    // 添加拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) async {
        // 在每次请求前添加token
        UserToken userToken = await TokenUtils().fetchToken();
        String? token = userToken.accessToken;
        if (token != null) {
          options.headers['Authorization'] = token;
        }
        return handler.next(options);
      }, onResponse: (response, handler) async {
        if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
          BaseResponse<dynamic> baseResponse = BaseResponse.fromJson(response.data as Map<String, dynamic>, (json) {
            return null;
          });
          if (baseResponse.code == 401) {
            //全局拦截401
            Get.offAll(() => const LoginPwdPage());
          } else {
            // 将响应传递给下一个处理程序
            return handler.next(response);
          }
        }else{
          return handler.next(response);
        }
      }),
    );

    //debug模式下打印网络请求
    if (foundation.kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        request: false, // 打印请求信息
        requestBody: true, // 打印请求体
        responseHeader: false, // 打印响应头
        responseBody: true, // 打印响应体
      ));
    }
  }
}
