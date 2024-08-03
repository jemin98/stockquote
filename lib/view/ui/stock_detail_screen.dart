import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockquote/utils/colors.dart';
import 'package:stockquote/view/widgets/vertical_space.dart';

import '../../utils/const.dart';
import '../widgets/app_bar.dart';
import '../widgets/horizontal_space.dart';
import 'bloc/search_provider.dart';
import 'chart_screen.dart';

class StockDetailScreen extends ConsumerStatefulWidget {
  String selectedSymbol;

  StockDetailScreen({required this.selectedSymbol});

  @override
  ConsumerState<StockDetailScreen> createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends ConsumerState<StockDetailScreen> {
  @override
  void initState() {
    getStockDetails();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(StockProvider);

    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HorizontalSpace(
              height: height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: CustomAppBar(
                  title: widget.selectedSymbol,
                  suffixTitle: "    ",
                  OnTap: () {
                    Navigator.pop(context);
                  },
                  OnSuffixTap: () {},
                  fontSize: width * 0.06),
            ),
            state.isLoading
                ? const CircularProgressIndicator()
                : state.stockDetailsResponse != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(width * 0.04),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.04),
                                  child: Image.network(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      state.stockDetailsResponse!.logo!),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width * 0.7,
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      "${state.stockDetailsResponse!.name}",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.05,
                                          color: AppColors.colorblue),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.stockPriceResponse!.c == null
                                            ? "0.0"
                                            : "\$${state.stockPriceResponse!.c?.toStringAsFixed(2)}",
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.bold,
                                            fontSize: width * 0.04,
                                            color: AppColors.colorBlack),
                                      ),
                                      VerticalSpace(width: width * 0.04),
                                      Text(
                                        state.stockPriceResponse!.d == null
                                            ? "0.0"
                                            : "${state.stockPriceResponse!.d?.toStringAsFixed(2)} (${state.stockPriceResponse!.dp?.toStringAsFixed(2)}%)",
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.04,
                                          color: state.stockPriceResponse!.d ==
                                                  null
                                              ? Colors.red.shade800
                                              : state.stockPriceResponse!.d! < 0
                                                  ? Colors.red.shade800
                                                  : Colors.green.shade800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              " * (NO DATA or ZERO as DATA sometime due to free limit)",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.normal,
                                  fontSize: width * 0.03,
                                  color: AppColors.colorGrey),
                            ),
                          ),
                          HorizontalSpace(
                            height: height * 0.01,
                          ),
                          SizedBox(
                              height: height * 0.4,
                              child: RealtimeStockData(
                                selectedSymbol: widget.selectedSymbol,
                              )),
                          HorizontalSpace(
                            height: height * 0.02,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Website: ${state.stockDetailsResponse!.weburl}",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.04,
                                      color: AppColors.colorBlack),
                                ),
                                HorizontalSpace(
                                  height: height * 0.01,
                                ),
                                Text(
                                  "Market Capitalization: \$${state.stockDetailsResponse!.marketCapitalization!.toStringAsFixed(2)}",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.04,
                                      color: AppColors.colorBlack),
                                ),
                                HorizontalSpace(
                                  height: height * 0.01,
                                ),
                                Text(
                                  "Ticker Symbol: ${state.stockDetailsResponse!.ticker}",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.04,
                                      color: AppColors.colorBlack),
                                ),
                                HorizontalSpace(
                                  height: height * 0.01,
                                ),
                                Text(
                                  "Exchange: ${state.stockDetailsResponse!.exchange}",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.04,
                                      color: AppColors.colorBlack),
                                ),
                                HorizontalSpace(
                                  height: height * 0.01,
                                ),
                                Text(
                                  "Industry: ${state.stockDetailsResponse!.finnhubIndustry}",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.04,
                                      color: AppColors.colorBlack),
                                ),
                                HorizontalSpace(
                                  height: height * 0.01,
                                ),
                                Text(
                                  "Country: ${state.stockDetailsResponse!.country}",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.04,
                                      color: AppColors.colorBlack),
                                ),
                                HorizontalSpace(
                                  height: height * 0.01,
                                ),
                                Text(
                                  "Currency: ${state.stockDetailsResponse!.currency}",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.04,
                                      color: AppColors.colorBlack),
                                ),
                                HorizontalSpace(
                                  height: height * 0.01,
                                ),
                              ],
                            ),
                          ),
                          if (state.stockPriceResponse!.c != null)
                            ...[]
                          else ...[
                            // Display a placeholder or message if stock price is not available
                            const Text(
                              "Stock price information not available yet.",
                              style:
                                  TextStyle(fontSize: 16.0, color: Colors.grey),
                            ),
                          ],
                        ],
                      )
                    : const Center(
                        child: Text("Something Went Wrong with server...."),
                      ),
          ],
        ),
      ),
    );
  }

  void getStockDetails() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(StockProvider.notifier).getStockData(widget.selectedSymbol);
    });
  }
}
