///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class UserToken {
/*
{
  "accessTokenExpire": "2024-03-15 15:31:13",
  "refreshTokenExpire": "2024-03-28 15:31:13",
  "access_token": "4dbc214681c142548b38355731213990",
  "refresh_token": "7067b018831c4b54b2d7ed4797852d14"
}
*/

  String? accessTokenExpire;
  String? refreshTokenExpire;
  String? accessToken;
  String? refreshToken;

  UserToken({
    this.accessTokenExpire,
    this.refreshTokenExpire,
    this.accessToken,
    this.refreshToken,
  });

  UserToken.fromJson(Map<String, dynamic> json) {
    accessTokenExpire = json['accessTokenExpire']?.toString();
    refreshTokenExpire = json['refreshTokenExpire']?.toString();
    accessToken = json['access_token']?.toString();
    refreshToken = json['refresh_token']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['accessTokenExpire'] = accessTokenExpire;
    data['refreshTokenExpire'] = refreshTokenExpire;
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
