class StockMetaData {
  String? endpoint;
  String? message;
  List<Data>? data;

  StockMetaData({this.endpoint, this.message, this.data});

  StockMetaData.fromJson(Map<String, dynamic> json) {
    endpoint = json['endpoint'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['endpoint'] = this.endpoint;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? contractID;
  String? symbol;
  String? expiration;
  String? strike;
  String? type;
  String? last;
  String? mark;
  String? bid;
  String? bidSize;
  String? ask;
  String? askSize;
  String? volume;
  String? openInterest;
  String? date;

  Data(
      {this.contractID,
      this.symbol,
      this.expiration,
      this.strike,
      this.type,
      this.last,
      this.mark,
      this.bid,
      this.bidSize,
      this.ask,
      this.askSize,
      this.volume,
      this.openInterest,
      this.date});

  Data.fromJson(Map<String, dynamic> json) {
    contractID = json['contractID'];
    symbol = json['symbol'];
    expiration = json['expiration'];
    strike = json['strike'];
    type = json['type'];
    last = json['last'];
    mark = json['mark'];
    bid = json['bid'];
    bidSize = json['bid_size'];
    ask = json['ask'];
    askSize = json['ask_size'];
    volume = json['volume'];
    openInterest = json['open_interest'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contractID'] = this.contractID;
    data['symbol'] = this.symbol;
    data['expiration'] = this.expiration;
    data['strike'] = this.strike;
    data['type'] = this.type;
    data['last'] = this.last;
    data['mark'] = this.mark;
    data['bid'] = this.bid;
    data['bid_size'] = this.bidSize;
    data['ask'] = this.ask;
    data['ask_size'] = this.askSize;
    data['volume'] = this.volume;
    data['open_interest'] = this.openInterest;
    data['date'] = this.date;
    return data;
  }
}
