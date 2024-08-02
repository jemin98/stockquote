import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockquote/utils/colors.dart';

import '../../utils/const.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  String suffixTitle;
  final VoidCallback? OnTap;
  final VoidCallback OnSuffixTap;
  double fontSize;
  CustomAppBar({
    Key? key,
    required this.title,
    required this.suffixTitle,
    this.OnTap,
    required this.OnSuffixTap,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OnTap != null
            ? GestureDetector(
                onTap: OnTap,
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: AppColors.black,
                ),
              )
            : Container(),
        Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: fontSize,
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
        ),
        GestureDetector(
          onTap: OnSuffixTap,
          child: Text(
            suffixTitle,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: width * 0.038,
                  color: AppColors.blue,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
