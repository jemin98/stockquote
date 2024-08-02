class ChartData {
  double? price;
  DateTime? time;

  ChartData({this.price, this.time});

  ChartData.fromJson(Map<String, dynamic> json) {
    price = double.parse(json["data"][0]['p']);
    time = DateTime.fromMillisecondsSinceEpoch(json["data"][0]['t']);
  }
}
