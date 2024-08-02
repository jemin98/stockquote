class StockDetailsResponse {
  String? country;
  String? currency;
  String? estimateCurrency;
  String? exchange;
  String? finnhubIndustry;
  String? ipo;
  String? logo;
  double? marketCapitalization;
  String? name;
  String? phone;
  String? ticker;
  String? weburl;

  StockDetailsResponse(
      {this.country,
      this.currency,
      this.estimateCurrency,
      this.exchange,
      this.finnhubIndustry,
      this.ipo,
      this.logo,
      this.marketCapitalization,
      this.name,
      this.phone,
      this.ticker,
      this.weburl});

  StockDetailsResponse.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    currency = json['currency'];
    estimateCurrency = json['estimateCurrency'];
    exchange = json['exchange'];
    finnhubIndustry = json['finnhubIndustry'];
    ipo = json['ipo'];
    logo = json['logo'];
    marketCapitalization = json['marketCapitalization'];
    name = json['name'];
    phone = json['phone'];

    ticker = json['ticker'];
    weburl = json['weburl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['estimateCurrency'] = this.estimateCurrency;
    data['exchange'] = this.exchange;
    data['finnhubIndustry'] = this.finnhubIndustry;
    data['ipo'] = this.ipo;
    data['logo'] = this.logo;
    data['marketCapitalization'] = this.marketCapitalization;
    data['name'] = this.name;
    data['phone'] = this.phone;

    data['ticker'] = this.ticker;
    data['weburl'] = this.weburl;
    return data;
  }
}
