// To parse this JSON data, do
//
//     final currenciesConverterModel = currenciesConverterModelFromJson(jsonString);

import 'dart:convert';

CurrenciesConverterModel currenciesConverterModelFromJson(String str, String currencie) =>
    CurrenciesConverterModel.fromJson(json.decode(str), currencie);

String currenciesConverterModelToJson(CurrenciesConverterModel data) => json.encode(data.toJson());

class CurrenciesConverterModel {
  CurrenciesConverterModel({
    this.amount,
    this.base,
    this.date,
    this.rates,
  });

  double amount;
  String base;
  DateTime date;
  Rates rates;

  factory CurrenciesConverterModel.fromJson(Map<String, dynamic> json, String currencie) => CurrenciesConverterModel(
        amount: json["amount"] == null ? null : json["amount"],
        base: json["base"] == null ? null : json["base"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        rates: json["rates"] == null ? null : Rates.fromJson(json["rates"], currencie),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount == null ? null : amount,
        "base": base == null ? null : base,
        "date": date == null
            ? null
            : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "rates": rates == null ? null : rates.toJson(),
      };
}

class Rates {
  Rates({
    this.usd,
  });

  double usd;

  factory Rates.fromJson(Map<String, dynamic> json, String currencie) => Rates(
        usd: json["USD"] == null ? null : json["USD"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd == null ? null : usd,
      };
}
