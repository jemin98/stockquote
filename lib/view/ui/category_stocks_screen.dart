import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockquote/utils/colors.dart';
import 'package:stockquote/utils/const.dart';
import 'package:stockquote/view/ui/stock_detail_screen.dart';
import 'package:stockquote/view/widgets/horizontal_space.dart';
import 'package:stockquote/view/widgets/vertical_space.dart';

import '../../data/models/response_models/stock_details_response.dart';
import 'bloc/search_provider.dart';

class StockCategoryScreen extends ConsumerStatefulWidget {
  const StockCategoryScreen({super.key});

  @override
  ConsumerState<StockCategoryScreen> createState() => _StockQuoteScreenState();
}

class _StockQuoteScreenState extends ConsumerState<StockCategoryScreen> {
  String selectedIndustry = "";

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(StockProvider);

    return Scaffold(
        backgroundColor: AppColors.colorWhite,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.colorWhite,
          title: Text(
            'Stock Category',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: width * 0.06,
                  color: AppColors.colorMainTheme,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        body: state.categoryWiseStocks != null &&
                state.categoryWiseStocks!.isNotEmpty
            ? Column(
                children: [
                  Container(
                    height: height * 0.05,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: AppColors.colorMainTheme.withOpacity(0.1),
                        border: Border.all(color: AppColors.colorBlack),
                        borderRadius:
                            BorderRadius.all(Radius.circular(width * 0.03))),
                    child: Center(
                      child: DropdownButton<String>(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        underline: const SizedBox(),
                        value: selectedIndustry,
                        items: _getIndustryDropdownItems(),
                        onChanged: (value) {
                          setState(() {
                            selectedIndustry = value ?? "NO Data";
                          });
                        },
                        hint: const Text('Select Industry'),
                      ),
                    ),
                  ),
                  HorizontalSpace(height: height * 0.02),
                  Expanded(
                    child: _getFilteredStocks().isEmpty
                        ? const Center(child: Text('Data Fetching...'))
                        : ListView.builder(
                            itemCount: _getFilteredStocks().length,
                            itemBuilder: (context, index) {
                              final stock = _getFilteredStocks()[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.04),
                                child: StockQuoteCard(stock: stock),
                              );
                            },
                          ),
                  ),
                ],
              )
            : const Center(
                child: Text('Data Fetching... (Search on first screen)'),
              ));
  }

  List<DropdownMenuItem<String>> _getIndustryDropdownItems() {
    final industries = ref
        .watch(StockProvider)
        .categoryWiseStocks
        ?.map((stock) => stock.finnhubIndustry)
        .toSet();
    return [const DropdownMenuItem(value: "", child: Text('All'))]
        .followedBy(industries!.map((industry) => DropdownMenuItem(
              value: industry,
              child: Text(industry ?? "no industry"),
            )))
        .toList();
  }

  List<StockDetailsResponse> _getFilteredStocks() {
    if (selectedIndustry.isEmpty) {
      return ref.watch(StockProvider).categoryWiseStocks ??
          []; // Handle null state and empty list
    }
    return ref
        .watch(StockProvider)
        .categoryWiseStocks!
        .where((stock) => stock.finnhubIndustry == selectedIndustry)
        .toList();
  }
}

class StockQuoteCard extends StatelessWidget {
  final StockDetailsResponse stock;

  const StockQuoteCard({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  StockDetailScreen(selectedSymbol: stock.ticker!),
            ));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: width * 0.02),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.02),
              border: Border.all(color: AppColors.colorLightGrey)),
          child: Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    decoration: const BoxDecoration(
                        color: AppColors.colorblue, shape: BoxShape.circle),
                    width: width * 0.1,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          stock.ticker ?? "No Data",
                          style: const TextStyle(color: AppColors.colorWhite),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )),
                VerticalSpace(width: width * 0.02),
                SizedBox(
                    width: width * 0.5,
                    child: Text(
                      stock.name ?? "No Data",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.04,
                          color: AppColors.colorblue),
                    )),
                const Spacer(),
                Text(
                  stock.marketCapitalization?.toStringAsFixed(2) ?? '-',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.04,
                      color: AppColors.colorMainTheme),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
