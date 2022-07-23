// To parse this JSON data, do
//
//     final countryListModel = countryListModelFromJson(jsonString);

import 'dart:convert';

//List<CountryListModel> countryListModelFromJson(var str) => List<CountryListModel>.from(json.decode(str).map((x) => CountryListModel.fromJson(x)));
List<CountryListModel> countryListModelFromJson(var str) =>  List<CountryListModel>.from(json.decode(str).map((x) => CountryListModel.fromJson(x)));

//List<CountryListModel> countryListModelFromJson(var str) => List<CountryListModel>.from(json.decode(str)).map((x) => CountryListModel.fromJson(x)).toList();

String countryListModelToJson(List<CountryListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryListModel {
    CountryListModel({
        this.countryName,
        this.countryShortName,
        this.countryPhoneCode,
    });

    String countryName;
    String countryShortName;
    int countryPhoneCode;

    factory CountryListModel.fromJson(Map<String, dynamic> json) => CountryListModel(
        countryName: json["country_name"] == null ? null : json["country_name"],
        countryShortName: json["country_short_name"] == null ? null : json["country_short_name"],
        countryPhoneCode: json["country_phone_code"] == null ? null : json["country_phone_code"],
    );

    Map<String, dynamic> toJson() => {
        "country_name": countryName == null ? null : countryName,
        "country_short_name": countryShortName == null ? null : countryShortName,
        "country_phone_code": countryPhoneCode == null ? null : countryPhoneCode,
    };
}
