import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  final double width;

  const VerticalSpace({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
