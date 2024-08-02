import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockquote/utils/colors.dart';

import '../../utils/const.dart';
import '../widgets/app_bar.dart';
import '../widgets/horizontal_space.dart';
import 'bloc/search_provider.dart';
import 'stock_detail_screen.dart';

class StockSearchScreen extends ConsumerStatefulWidget {
  const StockSearchScreen({super.key});

  @override
  ConsumerState<StockSearchScreen> createState() => _StockSearchScreenState();
}

class _StockSearchScreenState extends ConsumerState<StockSearchScreen> {
  TextEditingController searchController = TextEditingController();

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
                title: "Search",
                suffixTitle: "    ",
                OnSuffixTap: () {},
                fontSize: width * 0.06),
          ),
          HorizontalSpace(
            height: height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: height * 0.05,
              child: TextField(
                controller: searchController,
                onSubmitted: (query) {
                  if (query.isNotEmpty && query != "") {
                    notifier.searchStock(query);
                  } else {
                    notifier.clearOldSearch();
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        13,
                      ),
                    ),
                  ),
                  hintText: 'Search...',
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: height * 0.01566,
                      fontWeight: FontWeight.w400,
                      color: AppColors.hintColor,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        if (searchController.text.isNotEmpty &&
                            searchController.text != "") {
                          notifier.searchStock(searchController.text);
                        } else {
                          notifier.clearOldSearch();
                        }
                      },
                      child: const Icon(Icons.search)),
                ),
              ),
            ),
          ),
          HorizontalSpace(
            height: height * 0.02,
          ),
          (state.isLoading)
              ? const CircularProgressIndicator()
              : (state.stockSearchResponse != null)
                  ? (state.stockSearchResponse!.result!.isNotEmpty)
                      ? Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount:
                                state.stockSearchResponse!.result!.length,
                            itemBuilder: (context, index) {
                              final result =
                                  state.stockSearchResponse!.result![index];
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
                                        border: Border.all(
                                            color: AppColors.borderColor)),
                                    child: ListTile(
                                      title: Text(result.description ?? ''),
                                      subtitle: Text(
                                          'Symbol: ${result.symbol ?? ''}'),
                                      trailing: GestureDetector(
                                          onTap: () {
                                            (state.watchlist != null)
                                                ? state.watchlist!
                                                        .where((stock) =>
                                                            stock.symbol ==
                                                            result.symbol)
                                                        .isNotEmpty
                                                    ? notifier
                                                        .removeFromWatchlist(
                                                            result.symbol!)
                                                    : notifier
                                                        .addToWatchlist(result)
                                                : notifier
                                                    .addToWatchlist(result);
                                          },
                                          child: Icon(
                                            (state.watchlist != null)
                                                ? state.watchlist!
                                                        .where((stock) =>
                                                            stock.symbol ==
                                                            result.symbol)
                                                        .isNotEmpty
                                                    ? Icons.star
                                                    : Icons.star_border_outlined
                                                : Icons.star_border_outlined,
                                            color: (state.watchlist != null)
                                                ? state.watchlist!
                                                        .where((stock) =>
                                                            stock.symbol ==
                                                            result.symbol)
                                                        .isNotEmpty
                                                    ? AppColors.starColor
                                                    : AppColors.black
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
                          child: Text("NO DATA (Search Something else)"),
                        )
                  : const Center(
                      child: Text("Search Something...."),
                    ),
        ],
      ),
    );
  }
}
