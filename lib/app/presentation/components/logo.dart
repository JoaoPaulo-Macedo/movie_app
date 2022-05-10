import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.height,
  })  : assert(height > 0, 'height should be greater than 0'),
        super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo.png',
      key: const ValueKey('logo_image_key'),
      height: height,
    );
  }
}
