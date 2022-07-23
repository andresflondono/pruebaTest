// To parse this JSON data, do
//
//     final currenciesModel = currenciesModelFromJson(jsonString);

import 'dart:convert';

CurrenciesModel currenciesModelFromJson(String str) => CurrenciesModel.fromJson(json.decode(str));

String currenciesModelToJson(CurrenciesModel data) => json.encode(data.toJson());

class CurrenciesModel {
  CurrenciesModel({
    this.aud,
    this.bgn,
    this.brl,
    this.cad,
    this.chf,
    this.cny,
    this.czk,
    this.dkk,
    this.eur,
    this.gbp,
    this.hkd,
    this.hrk,
    this.huf,
    this.idr,
    this.ils,
    this.inr,
    this.isk,
    this.jpy,
    this.krw,
    this.mxn,
    this.myr,
    this.nok,
    this.nzd,
    this.php,
    this.pln,
    this.ron,
    this.sek,
    this.sgd,
    this.thb,
    this.currenciesModelTry,
    this.usd,
    this.zar,
  });

  String aud;
  String bgn;
  String brl;
  String cad;
  String chf;
  String cny;
  String czk;
  String dkk;
  String eur;
  String gbp;
  String hkd;
  String hrk;
  String huf;
  String idr;
  String ils;
  String inr;
  String isk;
  String jpy;
  String krw;
  String mxn;
  String myr;
  String nok;
  String nzd;
  String php;
  String pln;
  String ron;
  String sek;
  String sgd;
  String thb;
  String currenciesModelTry;
  String usd;
  String zar;

  factory CurrenciesModel.fromJson(Map<String, dynamic> json) => CurrenciesModel(
        aud: json["AUD"] == null ? null : json["AUD"],
        bgn: json["BGN"] == null ? null : json["BGN"],
        brl: json["BRL"] == null ? null : json["BRL"],
        cad: json["CAD"] == null ? null : json["CAD"],
        chf: json["CHF"] == null ? null : json["CHF"],
        cny: json["CNY"] == null ? null : json["CNY"],
        czk: json["CZK"] == null ? null : json["CZK"],
        dkk: json["DKK"] == null ? null : json["DKK"],
        eur: json["EUR"] == null ? null : json["EUR"],
        gbp: json["GBP"] == null ? null : json["GBP"],
        hkd: json["HKD"] == null ? null : json["HKD"],
        hrk: json["HRK"] == null ? null : json["HRK"],
        huf: json["HUF"] == null ? null : json["HUF"],
        idr: json["IDR"] == null ? null : json["IDR"],
        ils: json["ILS"] == null ? null : json["ILS"],
        inr: json["INR"] == null ? null : json["INR"],
        isk: json["ISK"] == null ? null : json["ISK"],
        jpy: json["JPY"] == null ? null : json["JPY"],
        krw: json["KRW"] == null ? null : json["KRW"],
        mxn: json["MXN"] == null ? null : json["MXN"],
        myr: json["MYR"] == null ? null : json["MYR"],
        nok: json["NOK"] == null ? null : json["NOK"],
        nzd: json["NZD"] == null ? null : json["NZD"],
        php: json["PHP"] == null ? null : json["PHP"],
        pln: json["PLN"] == null ? null : json["PLN"],
        ron: json["RON"] == null ? null : json["RON"],
        sek: json["SEK"] == null ? null : json["SEK"],
        sgd: json["SGD"] == null ? null : json["SGD"],
        thb: json["THB"] == null ? null : json["THB"],
        currenciesModelTry: json["TRY"] == null ? null : json["TRY"],
        usd: json["USD"] == null ? null : json["USD"],
        zar: json["ZAR"] == null ? null : json["ZAR"],
      );

  Map<String, dynamic> toJson() => {
        "AUD": aud == null ? null : aud,
        "BGN": bgn == null ? null : bgn,
        "BRL": brl == null ? null : brl,
        "CAD": cad == null ? null : cad,
        "CHF": chf == null ? null : chf,
        "CNY": cny == null ? null : cny,
        "CZK": czk == null ? null : czk,
        "DKK": dkk == null ? null : dkk,
        "EUR": eur == null ? null : eur,
        "GBP": gbp == null ? null : gbp,
        "HKD": hkd == null ? null : hkd,
        "HRK": hrk == null ? null : hrk,
        "HUF": huf == null ? null : huf,
        "IDR": idr == null ? null : idr,
        "ILS": ils == null ? null : ils,
        "INR": inr == null ? null : inr,
        "ISK": isk == null ? null : isk,
        "JPY": jpy == null ? null : jpy,
        "KRW": krw == null ? null : krw,
        "MXN": mxn == null ? null : mxn,
        "MYR": myr == null ? null : myr,
        "NOK": nok == null ? null : nok,
        "NZD": nzd == null ? null : nzd,
        "PHP": php == null ? null : php,
        "PLN": pln == null ? null : pln,
        "RON": ron == null ? null : ron,
        "SEK": sek == null ? null : sek,
        "SGD": sgd == null ? null : sgd,
        "THB": thb == null ? null : thb,
        "TRY": currenciesModelTry == null ? null : currenciesModelTry,
        "USD": usd == null ? null : usd,
        "ZAR": zar == null ? null : zar,
      };
}
