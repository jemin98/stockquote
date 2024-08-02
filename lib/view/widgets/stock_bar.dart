import 'package:flutter/material.dart';

class StockBar {
  String? description;
  String? displaySymbol;
  String? symbol;
  String? type;

  StockBar({this.description, this.displaySymbol, this.symbol, this.type});
}

class MyListView extends StatelessWidget {
  final List<StockBar> results;

  const MyListView({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final result = results[index];
        return ListTile(
          title: Text(result.description ?? ''),
          subtitle: Text('Symbol: ${result.symbol ?? ''}'),
          trailing: Text(result.type ?? ''),
        );
      },
    );
  }
}
