import 'package:my_flutter/utils/shared_preferences_helper.dart';

import '../bean/user_token.dart';
import '../common/constants.dart';

class TokenUtils {
  Future<void> save(UserToken? token) async {
    SharedPreferencesHelper.saveString(Constants.accessToken, token?.accessToken ?? "");
    SharedPreferencesHelper.saveString(Constants.refreshToken, token?.refreshToken ?? "");
  }

  Future<void> clear() async {
    SharedPreferencesHelper.remove(Constants.accessToken);
    SharedPreferencesHelper.remove(Constants.refreshToken);
  }

  Future<UserToken> fetchToken() async {
    String? accessToken = await SharedPreferencesHelper.getString(Constants.accessToken);
    String? refreshToken = await SharedPreferencesHelper.getString(Constants.refreshToken);
    UserToken token = UserToken(accessToken: accessToken, refreshToken: refreshToken);
    return token;
  }
}
