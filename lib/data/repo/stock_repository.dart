import 'package:either_dart/either.dart';

import '../models/response_models/search_stock_response.dart';
import '../models/response_models/stock_details_response.dart';
import '../models/response_models/stock_live_data_response.dart';
import '../models/response_models/stock_price_response.dart';

abstract class StockRepository {
  Future<Either<String, StockSearchResponse>> searchStock(String query);

  Future<Either<String, StockDetailsResponse>> searchStockData(
      String selectedSymbol);

  Future<Either<String, StockPriceResponse>> getPriceData(
      String selectedSymbol);

  Future<Either<String, List<ChartData>>> stockSocketConnect(
      String selectedSymbol);
}
