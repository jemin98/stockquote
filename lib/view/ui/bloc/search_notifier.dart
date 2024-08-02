import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stockquote/data/models/response_models/stock_details_response.dart';
import 'package:stockquote/view/ui/bloc/search_state.dart';

import '../../../../data/repo/stock_repository.dart';
import '../../../../utils/const.dart';
import '../../../data/models/response_models/search_stock_response.dart';

class StockNotifier extends StateNotifier<StockState> {
  final StockRepository _stockRepository;

  StockNotifier(this._stockRepository) : super(const StockState());

  searchStock(String query) async {
    state = state.copyWith(isLoading: true, stockSearchResponse: null);
    var res = await _stockRepository.searchStock(query);
    res.fold(
        (left) => Fluttertoast.showToast(
            msg: left,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            fontSize: 16.0), (right) async {
      state = state.copyWith(stockSearchResponse: right);

      state = state.copyWith(isLoading: false);
      final futures = right.result?.map((stock) =>
          compute<String, StockDetailsResponse?>(
              fetchIndustryForStock, stock.symbol!));

      final List<StockDetailsResponse?> industryMap =
          await Future.wait(futures?.toList() ?? []);

      List<StockDetailsResponse>? categoryWiseStocks =
          (state.categoryWiseStocks != null)
              ? state.categoryWiseStocks
              : <StockDetailsResponse>[];
      for (var stocks in industryMap) {
        var existingItem = categoryWiseStocks!.firstWhere(
          (itemToCheck) => itemToCheck.name == stocks!.name,
          orElse: () => StockDetailsResponse(name: null),
        );
        if (existingItem.name != null) {
          log("stock is already in list");
        } else {
          // categoryWiseStocks.add(stocks!);
          if (stocks!.finnhubIndustry != null && stocks.finnhubIndustry != "") {
            categoryWiseStocks = List.from(categoryWiseStocks)..add(stocks);
          }
          log("stock is added");
        }
      }
      // categoryWiseStocks = industryMap.cast<StockDetailsResponse>();

      state = state.copyWith(categoryWiseStocks: categoryWiseStocks);

      log("categoryWiseStocks ======>>> ${categoryWiseStocks!.toList().toString()}");
    });
  }

  clearOldSearch() {
    state = state.copyWith(isLoading: false, stockSearchResponse: null);
  }

  void addToWatchlist(Result stock) {
    state = state.copyWith(watchlist: [...?state.watchlist, stock]);
  }

  void removeFromWatchlist(String symbol) {
    state = state.copyWith(
        watchlist:
            state.watchlist!.where((stock) => stock.symbol != symbol).toList());
  }

  getStockData(String selectedSymbol) async {
    state = state.copyWith(isLoading: true);
    var res = await _stockRepository.searchStockData(selectedSymbol);
    var pricesData = await _stockRepository.getPriceData(selectedSymbol);
    res.fold(
        (left) => Fluttertoast.showToast(
            msg: left,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            fontSize: 16.0),
        (right) => state = state.copyWith(stockDetailsResponse: right));
    pricesData.fold(
        (left) => Fluttertoast.showToast(
            msg: left,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            fontSize: 16.0),
        (right) => state = state.copyWith(stockPriceResponse: right));
    state = state.copyWith(isLoading: false);
  }
}

// ---- IN SAME FILE FOR MAKE IT ISOLATE AND WON'T HURT APP PROGRESS ----
Future<StockDetailsResponse> fetchIndustryForStock(String symbol) async {
  Dio dio = Dio();
  final finnhubUrl = '$baseUrl/stock/profile2?symbol=$symbol&token=$token';
  try {
    final response = await dio.get(finnhubUrl);
    final stockDetailsResponse = StockDetailsResponse.fromJson(response.data);
    return stockDetailsResponse;
  } on DioException catch (e) {
    return StockDetailsResponse();
  }
}
