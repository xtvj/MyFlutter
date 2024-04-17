import 'package:flutter/material.dart';
import 'package:my_flutter/pages/home/home_page.dart';
import 'package:my_flutter/pages/login/login_code_page.dart';
import 'package:my_flutter/pages/login/login_pwd_input.dart';
import 'package:my_flutter/pages/login/login_top.dart';
import 'package:my_flutter/ui/background.dart';
import 'package:my_flutter/utils/token_utils.dart';

import '../../bean/base_response.dart';
import '../../bean/user_token.dart';
import '../../common/constants.dart';
import '../../network/api_manager.dart';
import '../../utils/log_utils.dart';
import 'agree_terms.dart';

//密码登录页面
class LoginPwdPage extends StatefulWidget {
  const LoginPwdPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPwdPageState();
  }
}

class _LoginPwdPageState extends State<LoginPwdPage> {
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSelectAgreeTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //防止弹出软键盘时背景变形
      resizeToAvoidBottomInset: false,
      body: Background(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Constants.defaultPadding),
              child: Column(
                children: [
                  const LoginTop(),
                  LoginPwdInput(
                    usernameController: _mobileController,
                    passwordController: _passwordController,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (_isSelectAgreeTerms && _mobileController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                          _login();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('请同意条款并输入用户名和密码')));
                        }
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginCodePage()),
                        );
                      },
                      child: const Text("验证码登录", style: TextStyle(fontSize: 20, color: Colors.black38)),
                    ),
                  ),
                  const Spacer(),
                  AgreeTerms(
                    isChecked: _isSelectAgreeTerms,
                    onChanged: (value) {
                      setState(() {
                        _isSelectAgreeTerms = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 50)
                ],
              ))),
    );
  }

  Future<void> _login() async {
    BaseResponse<dynamic> result = await ApiManager().loginEncode(
      _mobileController.text,
      _passwordController.text,
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
