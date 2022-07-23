import 'dart:convert';

import 'package:pruebaTest/app/app_constants.dart';

import 'package:http/http.dart' as http;
import 'package:pruebaTest/redux2/settingApp/store.dart';

class API {
  API();

  static const BASEAPIURL = 'api.frankfurter.app';

  String uidUser = "";

  static const String GET_CURRENCIES = "/currencies";
  static const String GET_CURRENCIES_CONVERTER = "/latest?amount=1&from=";

  static const String GET_CURRENCIES_HISTORY = "/2020-02-01..?to=";

  //static const String GET_COUNTRY_LIST = "/api/countries/";

  Future<MyHttpResponse> getCurrencies() async {
    var url = Uri.parse("https://" + BASEAPIURL + GET_CURRENCIES);
    print("prueba56: " + url.toString());
    MyHttpResponse response = await getRequest(url);
    print("prueba56: " + response.data.toString());
    try {
      if (response.statusCode == 200) {
        response.message = "exito";
      } else {
        response.message = "Error";
        response.data = null;
      }
    } catch (e) {
      response.message = e.toString();
      response.data = null;
    }
    return response;
  }

  Future<MyHttpResponse> getCurrenciesConverter(String currencies) async {
    var url = Uri.parse("https://" + BASEAPIURL + GET_CURRENCIES_CONVERTER + currencies + "&to=" + "USD");
    print(url.toString());
    MyHttpResponse response = await getRequest(url);
    try {
      if (response.statusCode == 200) {
        response.message = "exito";
      } else {
        response.message = "Error";
        response.data = null;
      }
    } catch (e) {
      response.message = e.toString();
      response.data = null;
    }
    return response;
  }

  Future<MyHttpResponse> getCurrenciesHistory(String currencies) async {
    var url = Uri.parse("https://" + BASEAPIURL + GET_CURRENCIES_HISTORY + currencies);
    print(url.toString());
    MyHttpResponse response = await getRequest(url);
    try {
      if (response.statusCode == 200) {
        response.message = "exito";
      } else {
        response.message = "Error";
        response.data = null;
      }
    } catch (e) {
      response.message = e.toString();
      response.data = null;
    }
    return response;
  }
}

Future<MyHttpResponse> getRequest(Uri uri) async {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    //  'api-token': 'TtucK5kuyLQtUuMIl0Mqoi8_SgMOTEHixVHKK3nMk1_D00Nvx0MriRFx82S_ofSUF9A',

    // 'user-email': 'alexecr66@gmail.com'
  };
  var response = await http.get(uri);

  print("prueba56: " + response.body);

  var data = /*json.decode(*/ utf8.decode(response.bodyBytes) /*)*/;

  return MyHttpResponse(response.statusCode, response.body);
}

class MyHttpResponse {
  int statusCode;
  String message;
  dynamic data;

  MyHttpResponse(this.statusCode, this.data, {this.message});

  @override
  String toString() {
    return 'MyHttpResponse{statusCode: $statusCode, message: $message, data: $data}';
  }
}
