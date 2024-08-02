import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stockquote/data/models/response_models/stock_live_data_response.dart';

import '../../../../data/models/response_models/search_stock_response.dart';
import '../../../../data/models/response_models/stock_details_response.dart';
import '../../../../data/models/response_models/stock_price_response.dart';

part 'search_state.freezed.dart';

@freezed
class StockState with _$StockState {
  const factory StockState({
    @Default(false) bool isLoading,
    StockSearchResponse? stockSearchResponse,
    StockDetailsResponse? stockDetailsResponse,
    StockPriceResponse? stockPriceResponse,
    List<StockDetailsResponse>? categoryWiseStocks,
    List<ChartData>? chartData,
    List<Result>? watchlist,
  }) = _SearchState;

  const StockState._();

  // To update stockSearchResponse
  StockState copyWithStockSearchResponse(StockSearchResponse newResponse) {
    return copyWith(stockSearchResponse: newResponse);
  }

  StockState copyWithStockDetailsResponse(StockDetailsResponse newResponse) {
    return copyWith(stockDetailsResponse: newResponse);
  }

  StockState copyWithStockPriceResponse(StockPriceResponse newResponse) {
    return copyWith(stockPriceResponse: newResponse);
  }

  StockState copyWithCategoryWiseStocksResponse(
      List<StockDetailsResponse> newResponse) {
    return copyWith(categoryWiseStocks: newResponse);
  }

  StockState copyWithChartDataResponse(List<ChartData> newResponse) {
    return copyWith(chartData: newResponse);
  }

  StockState copyWithResultResponse(List<Result> newResponse) {
    return copyWith(watchlist: newResponse);
  }
}
