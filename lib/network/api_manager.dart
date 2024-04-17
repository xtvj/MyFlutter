
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:my_flutter/bean/user_info.dart';
import 'package:my_flutter/network/api_service.dart';

import '../bean/base_response.dart';
import '../bean/user_token.dart';

class ApiManager{

  static final ApiManager _instance = ApiManager._internal();

  factory ApiManager() {
    return _instance;
  }

  ApiManager._internal();

  //通用的结果处理方法
  BaseResponse<T> _getResult<T>(Map<String, dynamic>? response, T Function(Map<String, dynamic>)? fromJsonT) {
    if (response == null) {
      return BaseResponse(msg: "网络异常，请重试", code: -1, data: null);
    }
    BaseResponse<T?> baseResponse = BaseResponse.fromJson(response, (json) {
      if (fromJsonT != null && json is Map<String, dynamic>) {
        return fromJsonT(json);
      } else {
        return null;
      }
    });
    if (baseResponse.code == 0) {
      return BaseResponse(msg: "", code: 0, data: baseResponse.data);
    } else {
      return BaseResponse(msg: baseResponse.msg, code: -1, data: null);
    }
  }

  //账号密码登录接口 密码经过base64加密
  Future<BaseResponse<dynamic>> loginEncode(String username, String password) async {
    Response<dynamic> response = await ApiService().dio.post(
      '/sys/auth/loginEncode',
      data: {
        'username': username,
        'password': base64Encode(utf8.encode(password)),
      },
    );
    return _getResult<UserToken>(response.data, UserToken.fromJson);
  }

  //登录接口 密码经过base64加密
  Future<BaseResponse<dynamic>> loginMobile(String mobile, String code) async {
    Response<dynamic> response = await ApiService().dio.post(
      '/sys/auth/mobile',
      data: {
        'mobile': mobile,
        'code': code,
      },
    );
    return _getResult<UserToken>(response.data, UserToken.fromJson);
  }

  //获取登录用户信息
  Future<BaseResponse<dynamic>> userInfo() async {
    Response<dynamic> response = await ApiService().dio.get(
      '/sys/user/info',
    );
    return _getResult<UserInfo>(response.data, UserInfo.fromJson);
  }

  //获取短信验证码
  Future<BaseResponse<dynamic>> getCode(String mobile) async {
    Response<dynamic> response = await ApiService().dio.post(
      '/sys/auth/send/code',
      data: {
        'mobile': mobile,
      },
    );
    return _getResult<dynamic>(response.data, null);
  }

}