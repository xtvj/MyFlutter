import 'package:flutter/material.dart';

class SwitchPwdButton extends StatefulWidget {
  const SwitchPwdButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<StatefulWidget> createState() {
    return _SwitchPwdButtonState();
  }
}

class _SwitchPwdButtonState extends State<SwitchPwdButton> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
        widget.onPressed();
      },
    );
  }
}
