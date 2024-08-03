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
    c = json['c'] != null ? double.parse(json['c'].toString()) : null;
    d = json['d'] != null ? double.parse(json['d'].toString()) : null;
    dp = json['dp'] != null ? double.parse(json['dp'].toString()) : null;
    h = json['h'] != null ? double.parse(json['h'].toString()) : null;
    l = json['l'] != null ? double.parse(json['l'].toString()) : null;
    o = json['o'] != null ? double.parse(json['o'].toString()) : null;
    pc = json['pc'] != null ? double.parse(json['pc'].toString()) : null;
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
