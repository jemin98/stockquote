import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  final double height;

  const HorizontalSpace({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
