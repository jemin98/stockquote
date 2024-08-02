import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            HorizontalSpace(
              height: height * 0.04,
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
            HorizontalSpace(
              height: height * 0.02,
            ),
            state.isLoading
                ? const CircularProgressIndicator()
                : state.stockDetailsResponse != null
                    ? Column(
                        children: [
                          Center(
                            child: Image.network(
                                state.stockDetailsResponse!.logo!),
                          ),
                          SizedBox(
                              height: height * 0.4,
                              child: RealtimeStockData(
                                selectedSymbol: widget.selectedSymbol,
                              )),
                          HorizontalSpace(
                            height: height * 0.01,
                          ),
                          Text(
                            "Ticker Symbol: ${state.stockDetailsResponse!.ticker}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          HorizontalSpace(
                            height: height * 0.01,
                          ),
                          Text(
                            "Company Name: ${state.stockDetailsResponse!.name}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          HorizontalSpace(
                            height: height * 0.01,
                          ),
                          Text(
                            "Market Capitalization: \$${state.stockDetailsResponse!.marketCapitalization!.toStringAsFixed(2)}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          HorizontalSpace(
                            height: height * 0.01,
                          ),
                          Text(
                            "Exchange: ${state.stockDetailsResponse!.exchange}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          HorizontalSpace(
                            height: height * 0.01,
                          ),
                          Text(
                            "Industry: ${state.stockDetailsResponse!.finnhubIndustry}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          HorizontalSpace(
                            height: height * 0.01,
                          ),
                          Text(
                            "Country: ${state.stockDetailsResponse!.country}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          HorizontalSpace(
                            height: height * 0.01,
                          ),
                          Text(
                            "Currency: ${state.stockDetailsResponse!.currency}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          HorizontalSpace(
                            height: height * 0.01,
                          ),
                          Text(
                            "Website: ${state.stockDetailsResponse!.weburl}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          if (state.stockPriceResponse!.c != null) ...[
                            Text(
                              "Current Price: \$${state.stockPriceResponse!.c?.toStringAsFixed(2)}",
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            HorizontalSpace(
                              height: height * 0.01,
                            ),
                            Text(
                              "Change: ${state.stockPriceResponse!.d?.toStringAsFixed(2)} (${state.stockPriceResponse!.dp?.toStringAsFixed(2)}%)",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: state.stockPriceResponse!.d! < 0
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                          ] else ...[
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
