import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../bean/base_response.dart';
import '../../common/constants.dart';
import '../../network/api_manager.dart';
import '../../ui/clear_button.dart';
import '../../ui/switch_pwd_button.dart';
import '../../utils/log_utils.dart';

class LoginCodeInput extends StatefulWidget {
  final TextEditingController mobileController;
  final TextEditingController codeController;

  const LoginCodeInput({
    super.key,
    required this.mobileController,
    required this.codeController,
  });

  @override
  State<StatefulWidget> createState() {
    return _LoginCodeInputState();
  }
}

class _LoginCodeInputState extends State<LoginCodeInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        //高度为屏幕高用的3/10
        height: MediaQuery.of(context).size.height * 3 / 10,
        child: Column(children: [
          const Spacer(),
          TextField(
            controller: widget.mobileController,
            //action为下一个
            textInputAction: TextInputAction.next,
            //键盘为电话号码
            keyboardType: TextInputType.phone,
            inputFormatters: [
              // 只允许输入数字
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              suffixIcon: ClearButton(controller: widget.mobileController),
              hintText: '请输入您的手机号',
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: Constants.spacePadding),
          SizedBox(
            width: Get.width,
            child: Row(children: [
              SizedBox(
                width: Get.width * 0.6,
                child: TextField(
                  controller: widget.codeController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixIcon: SwitchPwdButton(
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                    hintText: '请输入验证码',
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                child: FilledButton(
                  onPressed: () {
                    if (widget.mobileController.text.length == 11) {
                      _getCode();
                    } else {
                      Get.snackbar(
                        "标题",
                        "请输入正确的手机号",
                        barBlur: 20,
                        isDismissible: true,
                        duration: const Duration(seconds: 3),
                      );
                    }
                  },
                  child: const Text("获取验证码", style: TextStyle(fontSize: 16)),
                ),
              )
            ]),
          ),
          const Spacer(),
        ]));
  }

  Future<void> _getCode() async {
    BaseResponse<dynamic> result = await ApiManager().getCode(
      widget.mobileController.text,
    );
    Get.snackbar(
      'Hello', // title
      (result.code == 0) ? "获取验证码成功" : "获取验证码失败: ${result.msg}",
      barBlur: 20,
      isDismissible: true,
      duration: const Duration(seconds: 3),
    );
    LogUtils.logs((result.code == 0) ? "获取验证码成功 ${result.msg}" : "获取验证码失败: ${result.msg}");
  }
}
