import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockquote/utils/colors.dart';
import 'package:stockquote/utils/const.dart';
import 'package:stockquote/view/ui/stock_detail_screen.dart';
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
        appBar: AppBar(
          title: const Text('Stock Category'),
        ),
        body: state.categoryWiseStocks != null &&
                state.categoryWiseStocks!.isNotEmpty
            ? Column(
                children: [
                  DropdownButton<String>(
                    value: selectedIndustry,
                    items: _getIndustryDropdownItems(),
                    onChanged: (value) {
                      setState(() {
                        selectedIndustry = value ?? "NO Data";
                      });
                    },
                    hint: const Text('Select Industry'),
                  ),
                  Expanded(
                    child: _getFilteredStocks().isEmpty
                        ? const Center(child: Text('Data Fetching...'))
                        : ListView.builder(
                            itemCount: _getFilteredStocks().length,
                            itemBuilder: (context, index) {
                              final stock = _getFilteredStocks()[index];
                              return StockQuoteCard(stock: stock);
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
    log('industries :: ==>> ${ref.watch(StockProvider).categoryWiseStocks}');
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
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: AppColors.blue, shape: BoxShape.circle),
                  width: width * 0.1,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        stock.ticker ?? "No Data",
                        style: const TextStyle(color: AppColors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )),
              VerticalSpace(width: width * 0.02),
              SizedBox(
                  width: width * 0.6,
                  child: Text(
                    stock.name ?? "No Data",
                    overflow: TextOverflow.ellipsis,
                  )),
              const Spacer(),
              Text(stock.marketCapitalization?.toStringAsFixed(2) ?? '-'),
            ],
          ),
        ),
      ),
    );
  }
}
