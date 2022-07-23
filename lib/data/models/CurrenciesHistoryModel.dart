// To parse this JSON data, do
//
//     final currenciesHistoryModel = currenciesHistoryModelFromJson(jsonString);

import 'dart:convert';

CurrenciesHistoryModel currenciesHistoryModelFromJson(String str, String value) => CurrenciesHistoryModel.fromJson(json.decode(str), value);

String currenciesHistoryModelToJson(CurrenciesHistoryModel data) => json.encode(data.toJson());

class CurrenciesHistoryModel {
  CurrenciesHistoryModel({
    this.amount,
    this.base,
    this.startDate,
    this.endDate,
    this.rates,
  });

  double amount;
  String base;
  DateTime startDate;
  DateTime endDate;
  Map<String, Rate> rates;

  factory CurrenciesHistoryModel.fromJson(Map<String, dynamic> json, String value) => CurrenciesHistoryModel(
        amount: json["amount"] == null ? null : json["amount"],
        base: json["base"] == null ? null : json["base"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        rates: json["rates"] == null ? null : Map.from(json["rates"]).map((k, v) => MapEntry<String, Rate>(k, Rate.fromJson(v, value))),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount == null ? null : amount,
        "base": base == null ? null : base,
        "start_date": startDate == null
            ? null
            : "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": endDate == null
            ? null
            : "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "rates": rates == null ? null : Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Rate {
  Rate({
    this.usd,
  });

  double usd;

  factory Rate.fromJson(Map<String, dynamic> json, String value) => Rate(
        usd: json[value] == null ? null : json[value].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd == null ? null : usd,
      };
}
