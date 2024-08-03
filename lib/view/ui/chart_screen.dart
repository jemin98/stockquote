import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stockquote/utils/colors.dart';
import 'package:stockquote/utils/const.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

String wsUrl = 'wss://ws.finnhub.io?token=$token';

class RealtimeStockData extends StatefulWidget {
  String selectedSymbol;

  RealtimeStockData({required this.selectedSymbol});

  @override
  _RealtimeStockDataState createState() => _RealtimeStockDataState();
}

class _RealtimeStockDataState extends State<RealtimeStockData> {
  late WebSocketChannel _channel;
  late TooltipBehavior _tooltipBehavior;
  final Queue<ChartData> _chartData = Queue();
  static const int maxDataPoints = 10;
  @override
  void initState() {
    super.initState();
    _initWebSocket();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _listenToWebSocketStream();
  }

  void _listenToWebSocketStream() {
    _channel.stream.listen((message) {
      final data = jsonDecode(message) as Map<String, dynamic>;
      if (data["data"] != null) {
        final price = double.parse(data["data"][0]['p'].toString());
        final time = DateTime.fromMillisecondsSinceEpoch(data["data"][0]['t']);

        _chartData.add(ChartData(price: price, time: time));
        if (_chartData.length > maxDataPoints) {
          _chartData.removeFirst();
        }

        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  Future<void> _initWebSocket() async {
    log('connect started...');
    _channel = WebSocketChannel.connect(Uri.parse(wsUrl));
    await _channel.ready;
    log('connected...');
    _channel.sink.add(
        jsonEncode({'type': 'subscribe', 'symbol': widget.selectedSymbol}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(width * 0.04),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.colorblue),
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.04),
            ),
            color: AppColors.colorWhite,
          ),
          child: Padding(
            padding: EdgeInsets.all(width * 0.04),
            child: Center(
                child: SizedBox(
              height: height * 0.4,
              child: SfCartesianChart(
                legend: const Legend(isVisible: false),
                series: getDefaultData(),
                tooltipBehavior: _tooltipBehavior,
              ),
            )),
          )),
    );
  }

  List<LineSeries<ChartData, num>> getDefaultData() {
    const bool isDataLabelVisible = true;
    double? lineWidth;

    return <LineSeries<ChartData, num>>[
      LineSeries<ChartData, num>(
          enableTooltip: false,
          dataSource: _chartData.toList(),
          xValueMapper: (ChartData sales, _) =>
              sales.time.millisecondsSinceEpoch,
          yValueMapper: (ChartData sales, _) => sales.price,
          width: lineWidth ?? 2,
          dataLabelSettings: const DataLabelSettings(
              isVisible: isDataLabelVisible,
              labelAlignment: ChartDataLabelAlignment.auto)),
    ];
  }
}

class ChartData {
  final double price;
  final DateTime time;

  ChartData({required this.price, required this.time});
}
