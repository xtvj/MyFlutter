import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/pages/login/login_pwd_page.dart';
import 'package:my_flutter/utils/token_utils.dart';
import 'package:provider/provider.dart';

import '../../provider/user_info_provider.dart';

class SettingsPage extends StatelessWidget {
   const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
      ),
      body: Consumer<UserInfoProvider>(
        builder: (context, userInfoProvider, child) {
          //获取一次数据 todo 设计不合理
          if(userInfoProvider.userInfo == null){
            userInfoProvider.fetchUserInfo();
          }
          return Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: userInfoProvider.userInfo?.avatar != null
                    ? NetworkImage('${userInfoProvider.userInfo!.avatar}') as ImageProvider<Object>
                    :  null, // 这里是你的默认头像
              ),
              Text('用户名: ${userInfoProvider.userInfo?.username}'),
              Text('手机号: ${userInfoProvider.userInfo?.mobile}'),
              OutlinedButton(onPressed: (){
                TokenUtils().clear();
                Get.offAll(() => const LoginPwdPage());
              }, child: const Text("退出登录"))
            ],
          );
        },
      ),
    );
  }
}

