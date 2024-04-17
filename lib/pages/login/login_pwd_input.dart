import 'package:flutter/material.dart';

import '../../common/constants.dart';
import '../../ui/clear_button.dart';
import '../../ui/switch_pwd_button.dart';

class LoginPwdInput extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginPwdInput({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  State<StatefulWidget> createState() {
    return _LoginPwdInputState();
  }
}

class _LoginPwdInputState extends State<LoginPwdInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        //高度为屏幕高用的3/10
        height: MediaQuery.of(context).size.height * 3 / 10,
        child: Column(children: [
          const Spacer(),
          TextField(
            controller: widget.usernameController,
            //action为下一个
            textInputAction: TextInputAction.next,
            //键盘为英文和数字
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              suffixIcon: ClearButton(controller: widget.usernameController),
              hintText: '请输入您的用户名',
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: Constants.spacePadding),
          TextField(
            controller: widget.passwordController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            obscureText: _obscureText,
            decoration: InputDecoration(
              suffixIcon: SwitchPwdButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              hintText: '请输入密码',
              border: const OutlineInputBorder(),
            ),
          ),
          const Spacer(),
        ]));
  }
}
