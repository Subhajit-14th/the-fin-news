class MarketDataApiResModel {
  String? message;
  int? status;
  List<Record>? record;

  MarketDataApiResModel({this.message, this.status, this.record});

  MarketDataApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['record'] != null) {
      record = <Record>[];
      json['record'].forEach((v) {
        record!.add(Record.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (record != null) {
      data['record'] = record!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Record {
  String? id;
  String? marketDataCategory;
  String? marketDataType;
  String? value1;
  String? value2;
  String? value3;
  String? cashType;
  String? price;
  String? cashType2;
  String? price2;
  String? date;

  Record(
      {this.id,
      this.marketDataCategory,
      this.marketDataType,
      this.value1,
      this.value2,
      this.value3,
      this.cashType,
      this.price,
      this.cashType2,
      this.price2,
      this.date});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marketDataCategory = json['market data category'];
    marketDataType = json['market data type'];
    value1 = json['value1'];
    value2 = json['value2'];
    value3 = json['value3'];
    cashType = json['cash type'];
    price = json['price'];
    cashType2 = json['cash type 2'];
    price2 = json['Price 2'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['market data category'] = marketDataCategory;
    data['market data type'] = marketDataType;
    data['value1'] = value1;
    data['value2'] = value2;
    data['value3'] = value3;
    data['cash type'] = cashType;
    data['price'] = price;
    data['cash type 2'] = cashType2;
    data['Price 2'] = price2;
    data['date'] = date;
    return data;
  }
}
