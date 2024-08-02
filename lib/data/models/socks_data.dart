class Stock {
  final String symbol;
  final String companyName;
  final double currentPrice;
  final double change;
  final double changePercentage;

  Stock({
    required this.symbol,
    required this.companyName,
    required this.currentPrice,
    required this.change,
    required this.changePercentage,
  });
}
