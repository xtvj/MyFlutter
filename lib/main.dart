import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_flutter/pages/home/home_page.dart';
import 'package:my_flutter/pages/login/login_pwd_page.dart';
import 'package:my_flutter/utils/token_utils.dart';
import 'bean/user_token.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  UserToken? _token;

  @override
  void initState() {
    super.initState();
    _fetchToken();
  }

  Future<void> _fetchToken() async {
    _token = await TokenUtils().fetchToken();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'XX平台',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: (_token == null)
          ? const CircularProgressIndicator()
          : (_token!.accessToken == null || _token!.refreshToken == null)
          ? const LoginPwdPage()
          : const HomePage(),
    );
  }
}

