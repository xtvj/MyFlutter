import 'package:flutter/material.dart';
import 'package:my_flutter/network/api_manager.dart';
import 'package:my_flutter/utils/log_utils.dart';
import '../../bean/base_response.dart';
import '../../bean/user_token.dart';
import '../../common/constants.dart';
import '../../utils/token_utils.dart';
import '../home/home_page.dart';
import 'login_code_input.dart';
import 'login_top.dart';

//手机验证码登录页面
class LoginCodePage extends StatefulWidget {
  const LoginCodePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginCodePageState();
  }
}

class _LoginCodePageState extends State<LoginCodePage> {
  final _mobileController = TextEditingController();
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //防止弹出软键盘时背景变形
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.defaultPadding),
        child: Column(
          children: <Widget>[
            const LoginTop(),
            LoginCodeInput(
              mobileController: _mobileController,
              codeController: _codeController,
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  _login();
                },
                child: const Text("立即登录", style: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(height: Constants.spacePadding),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  //跳转到验证码登录页面
                  Navigator.pop(context);
                },
                child: const Text("密码登录", style: TextStyle(fontSize: 20, color: Colors.black38)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    BaseResponse<dynamic> result = await ApiManager().loginMobile(
      _mobileController.text,
      _codeController.text,
    );
    UserToken? token = result.data;
    if (result.code == 0) {
      //登录成功后保存token
      TokenUtils().save(token);
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
              (route) => false,
        );
      }
      LogUtils.logs("登录成功: ${token?.accessToken}");
    } else {
      LogUtils.logs("登录失败:${result.msg}");
    }
  }
}
