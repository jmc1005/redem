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
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 5,
          ),
          width: MediaQuery.of(context).size.width,
          height: size,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(asset),
            ),
          ),
        ),
      ],
    );
  }
}
