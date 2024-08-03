import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockquote/utils/colors.dart';
import 'package:stockquote/utils/const.dart';
import 'package:stockquote/view/ui/stock_search_screen.dart';
import 'package:stockquote/view/ui/watchlist_screen.dart';

import 'category_stocks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  final pages = const [
    StockSearchScreen(),
    StockCategoryScreen(),
    StockWatchListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: width * 0.16,
        decoration: BoxDecoration(
          color: AppColors.colorMainTheme,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(width * 0.06),
            topRight: Radius.circular(width * 0.06),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  pageIndex == 0
                      ? Icon(
                          Icons.search,
                          color: AppColors.colorWhite,
                          size: width * 0.08,
                        )
                      : Icon(
                          Icons.search_outlined,
                          color: AppColors.colorLight,
                          size: width * 0.06,
                        ),
                  Text(
                    "Search",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500,
                        fontSize: width * 0.03,
                        color: pageIndex == 0
                            ? AppColors.colorWhite
                            : AppColors.colorLight),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  pageIndex == 1
                      ? Icon(
                          Icons.category,
                          color: AppColors.colorWhite,
                          size: width * 0.08,
                        )
                      : Icon(
                          Icons.category_outlined,
                          color: AppColors.colorLight,
                          size: width * 0.06,
                        ),
                  Text(
                    "Category",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500,
                        fontSize: width * 0.03,
                        color: pageIndex == 1
                            ? AppColors.colorWhite
                            : AppColors.colorLight),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  pageIndex == 2
                      ? Icon(
                          Icons.favorite,
                          color: AppColors.colorWhite,
                          size: width * 0.08,
                        )
                      : Icon(
                          Icons.favorite_border_outlined,
                          color: AppColors.colorLight,
                          size: width * 0.06,
                        ),
                  Text(
                    "Wishlist",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500,
                        fontSize: width * 0.03,
                        color: pageIndex == 2
                            ? AppColors.colorWhite
                            : AppColors.colorLight),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
