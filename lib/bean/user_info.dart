///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class UserInfo {
/*
{
  "id": "1750409007274786100",
  "username": "admin",
  "realName": "admin",
  "avatar": "https://cdn.maku.net/images/avatar.png",
  "gender": 0,
  "email": "babamu@126.com",
  "mobile": "13612345678",
  "status": 1,
  "superAdmin": 1
}
*/

  String? id;
  String? username;
  String? realName;
  String? avatar;
  int? gender;
  String? email;
  String? mobile;
  int? status;
  int? superAdmin;

  UserInfo({
    this.id,
    this.username,
    this.realName,
    this.avatar,
    this.gender,
    this.email,
    this.mobile,
    this.status,
    this.superAdmin,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    username = json['username']?.toString();
    realName = json['realName']?.toString();
    avatar = json['avatar']?.toString();
    gender = json['gender']?.toInt();
    email = json['email']?.toString();
    mobile = json['mobile']?.toString();
    status = json['status']?.toInt();
    superAdmin = json['superAdmin']?.toInt();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['realName'] = realName;
    data['avatar'] = avatar;
    data['gender'] = gender;
    data['email'] = email;
    data['mobile'] = mobile;
    data['status'] = status;
    data['superAdmin'] = superAdmin;
    return data;
  }
}