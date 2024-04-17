import 'package:flutter/material.dart';

class AgreeTerms extends StatefulWidget {
  const AgreeTerms({super.key, required this.onChanged, this.isChecked = false});
  final ValueChanged<bool?> onChanged;
  final bool isChecked;

  @override
  State<StatefulWidget> createState() {
    return _AgreeTermsState();
  }
}

class _AgreeTermsState extends State<AgreeTerms> {
  bool? isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value;
            });
            widget.onChanged(value);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        const Text("已阅读并同意《服务条款》与《隐私权政策》"),
      ],
    );
  }
}

