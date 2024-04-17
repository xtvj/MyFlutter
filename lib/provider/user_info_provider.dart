
import 'package:flutter/cupertino.dart';
import 'package:my_flutter/bean/user_info.dart';
import 'package:my_flutter/network/api_manager.dart';

import '../bean/base_response.dart';

class UserInfoProvider with ChangeNotifier{

  UserInfo? _userInfo;

  UserInfo? get userInfo => _userInfo;

  Future<void> fetchUserInfo() async {
    BaseResponse<dynamic> result  = await ApiManager().userInfo();
    _userInfo = result.data;
    notifyListeners();
  }

}