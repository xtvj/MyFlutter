
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
    this.background = "assets/svg/background.svg",
  });

  final String background;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              background,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            child,
          ],
        ),
    );
  }
}
