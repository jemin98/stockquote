// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:stockquote/data/models/response_models/stock_details_response.dart';
import 'package:stockquote/data/models/response_models/stock_price_response.dart';
import 'package:stockquote/utils/const.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../models/response_models/search_stock_response.dart';
import '../../models/response_models/stock_live_data_response.dart';
import '../stock_repository.dart';

class StockRepositoryImpl implements StockRepository {
  Dio dio = Dio();

  @override
  Future<Either<String, StockSearchResponse>> searchStock(String query) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        String url = "$baseUrl/search/?q=$query&token=$token";
        log("api start : $url");
        var res = await dio.get(url);
        log("api status code : ${res.statusCode}");
        log("api response : ${res.data}");

        if (res.statusCode == 200) {
          final filteredData = _filterSymbols(res.data);

          StockSearchResponse stockSearchResponse = StockSearchResponse();
          stockSearchResponse = StockSearchResponse.fromJson(filteredData);

          return Right(stockSearchResponse);
        } else {
          return Left("API call failed with status code: ${res.statusCode}");
        }
      } else {
        return const Left("internet not working!");
      }
    } catch (e) {
      log('Unexpected error: $e');
      return const Left("An unexpected error occurred!");
    }
  }

  Map<String, dynamic> _filterSymbols(Map<String, dynamic> data) {
    final Map<String, dynamic> modifiedData = {};
    if (data['result'] != null) {
      modifiedData['result'] = (data['result'] as List).where((item) {
        final resultItem = item as Map<String, dynamic>;
        return !resultItem['symbol'].toString().contains('.');
      }).toList();
    }
    modifiedData['count'] = data['count'];
    return modifiedData;
  }

  @override
  Future<Either<String, StockDetailsResponse>> searchStockData(
      String selectedSymbol) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        String url =
            "$baseUrl/stock/profile2?symbol=$selectedSymbol&token=$token";
        log("api start : $url");
        var res = await dio.get(url);
        log("api status code : ${res.statusCode}");
        log("api response : ${res.data}");

        if (res.statusCode == 200) {
          StockDetailsResponse stockDetailsResponse = StockDetailsResponse();
          stockDetailsResponse = StockDetailsResponse.fromJson(res.data);

          return Right(stockDetailsResponse);
        } else {
          // Handle non-200 status code (e.g., return Left with error message)
          return Left("API call failed with status code: ${res.statusCode}");
        }
      } else {
        return const Left("internet not working!");
      }
    } catch (e) {
      // Handle other potential exceptions (e.g., return Left with error message)
      log('Unexpected error: $e');
      return Left("An unexpected error occurred!");
    }
  }

  @override
  Future<Either<String, StockPriceResponse>> getPriceData(
      String selectedSymbol) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        String url = "$baseUrl/quote?symbol=$selectedSymbol&token=$token";
        log("api start : $url");
        var res = await dio.get(url);
        log("api status code : ${res.statusCode}");
        log("api response : ${res.data}");

        if (res.statusCode == 200) {
          StockPriceResponse stockPriceResponse = StockPriceResponse();
          stockPriceResponse = StockPriceResponse.fromJson(res.data);
          return Right(stockPriceResponse);
        } else {
          return Left("API call failed with status code: ${res.statusCode}");
        }
      } else {
        return const Left("internet not working!");
      }
    } catch (e) {
      // Handle other potential exceptions (e.g., return Left with error message)
      log('Unexpected error: $e');
      return Left("An unexpected error occurred!");
    }
  }

  @override
  Future<Either<String, List<ChartData>>> stockSocketConnect(
      String selectedSymbol) async {
    try {
      log('connect started...');
      late WebSocketChannel _channel;
      String wsUrl = 'wss://ws.finnhub.io?token=$token';
      _channel = WebSocketChannel.connect(Uri.parse(wsUrl));
      await _channel.ready;
      log('connected...');
      _channel.sink
          .add(jsonEncode({'type': 'subscribe', 'symbol': selectedSymbol}));
      List<ChartData> chartData = [];
      _channel.stream.listen((message) {
        ChartData chart = ChartData.fromJson(message);

        chartData.add(chart);
      });

      return Right(chartData);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}
