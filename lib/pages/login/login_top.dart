import 'package:flutter/material.dart';
import '../../common/constants.dart';

class LoginTop extends StatelessWidget {
  const LoginTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 4,
        width: double.infinity,
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
              Spacer(),
              Text("欢迎来到XXXX平台", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black), textAlign: TextAlign.start),
              SizedBox(height: Constants.spacePadding),
              Text("登录即注册", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black26), textAlign: TextAlign.start)
            ]));
  }
}
