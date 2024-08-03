import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockquote/utils/colors.dart';
import 'package:stockquote/utils/const.dart';

import 'package:lottie/lottie.dart';
import 'package:stockquote/view/widgets/horizontal_space.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: Container(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HorizontalSpace(
              height: height * 0.35,
            ),
            SizedBox(
                height: height * 0.18,
                width: width * 0.55,
                child: Lottie.asset("assets/lottie/splash.json")),
            HorizontalSpace(
              height: height * 0.01,
            ),
            Text(
              "StockQuote",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.08,
                  color: AppColors.colorMainTheme),
            ),
            Text(
              "Prepared By JeminSohaliya",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.035,
                  color: AppColors.colorblue),
            ),
          ],
        ),
      ),
    );
  }
}
