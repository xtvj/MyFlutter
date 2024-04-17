
class BaseResponse<T> {
  final String msg;
  final int code;
  final T? data;

  BaseResponse({required this.msg, required this.code, required this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => BaseResponse<T>(
    msg: json['msg'] as String,
    code: json['code'] as int,
    data: fromJsonT(json['data']),
  );
}
