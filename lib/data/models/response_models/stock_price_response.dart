class StockPriceResponse {
  double? c;
  double? d;
  double? dp;
  double? h;
  double? l;
  double? o;
  double? pc;
  int? t;

  StockPriceResponse(
      {this.c, this.d, this.dp, this.h, this.l, this.o, this.pc, this.t});

  StockPriceResponse.fromJson(Map<String, dynamic> json) {
    c = double.parse(json['c'].toString());
    d = double.parse(json['d'].toString());
    dp = double.parse(json['dp'].toString());
    h = double.parse(json['h'].toString());
    l = double.parse(json['l'].toString());
    o = double.parse(json['o'].toString());
    pc = double.parse(json['pc'].toString());
    t = json['t'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c'] = this.c;
    data['d'] = this.d;
    data['dp'] = this.dp;
    data['h'] = this.h;
    data['l'] = this.l;
    data['o'] = this.o;
    data['pc'] = this.pc;
    data['t'] = this.t;
    return data;
  }
}
