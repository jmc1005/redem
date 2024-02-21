import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    required this.size,
    required this.asset,
    this.borderWidth = 0,
  });

  final double size;
  final String asset;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size,
          width: size,
          child: Image.asset(asset),
        ),
      ],
    );
  }
}
