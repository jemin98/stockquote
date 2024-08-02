import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockquote/view/ui/stock_detail_screen.dart';

import '../../utils/colors.dart';
import '../../utils/const.dart';
import '../widgets/app_bar.dart';
import '../widgets/horizontal_space.dart';
import 'bloc/search_provider.dart';

class StockWatchListScreen extends ConsumerStatefulWidget {
  const StockWatchListScreen({super.key});

  @override
  ConsumerState<StockWatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends ConsumerState<StockWatchListScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(StockProvider);
    final notifier = ref.read(StockProvider.notifier);
    return Scaffold(
      body: Column(
        children: [
          HorizontalSpace(
            height: height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomAppBar(
                title: "WatchList",
                suffixTitle: "    ",
                OnSuffixTap: () {},
                fontSize: width * 0.06),
          ),
          HorizontalSpace(
            height: height * 0.02,
          ),
          (state.watchlist != null)
              ? Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: state.watchlist!.length,
                    itemBuilder: (context, index) {
                      final result = state.watchlist![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StockDetailScreen(
                                    selectedSymbol: result.symbol!),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * 0.02),
                                border:
                                    Border.all(color: AppColors.borderColor)),
                            child: ListTile(
                              title: Text(result.description ?? ''),
                              subtitle: Text('Symbol: ${result.symbol ?? ''}'),
                              trailing: GestureDetector(
                                  onTap: () {
                                    state.watchlist!
                                            .where((stock) =>
                                                stock.symbol == result.symbol)
                                            .isNotEmpty
                                        ? notifier
                                            .removeFromWatchlist(result.symbol!)
                                        : notifier.addToWatchlist(result);
                                  },
                                  child: Icon(
                                    state.watchlist!
                                            .where((stock) =>
                                                stock.symbol == result.symbol)
                                            .isNotEmpty
                                        ? Icons.star
                                        : Icons.star_border_outlined,
                                    color: state.watchlist!
                                            .where((stock) =>
                                                stock.symbol == result.symbol)
                                            .isNotEmpty
                                        ? AppColors.starColor
                                        : AppColors.black,
                                  )),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const Center(
                  child: Text("Add Something in WatchList...."),
                ),
        ],
      ),
    );
  }
}
