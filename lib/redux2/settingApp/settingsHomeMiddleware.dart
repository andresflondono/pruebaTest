import 'dart:async';

import 'package:pruebaTest/app/app_settings.dart';
import 'package:pruebaTest/data/models/CountryList.dart';
import 'package:pruebaTest/data/models/CurrenciesConverter.dart';
import 'package:pruebaTest/data/models/CurrenciesHistoryModel.dart';
import 'package:pruebaTest/data/models/CurrenciesModel.dart';

import 'package:pruebaTest/data/networking/api.dart';
import 'package:pruebaTest/redux2/app/app_state.dart';
import 'package:pruebaTest/redux2/settingApp/settingsHomeState.dart';
import 'package:pruebaTest/redux2/settingApp/store.dart';
import 'package:pruebaTest/redux2/store.dart';
import 'package:pruebaTest/utils/alert.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'settingsHomeActions.dart';

class settingHomeMiddleware extends MiddlewareClass<AppState> {
  settingHomeMiddleware(this.api);

  final API api;

  @override
  Future<void> call(Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);

    if (action is getCurrencieAction) {
      return _getCurrencies(next, action, store);
    }

    if (action is getCurrencieConverterAction) {
      return _getCurrencieConverter(next, action, store);
    }

    if (action is getCurrencieHistoryAction) {
      return _getCurrencieHistory(next, action, store);
    }
  }
}

Future<void> _getCurrencieConverter(NextDispatcher next, getCurrencieConverterAction action, Store<AppState> store) async {
  var response = await API().getCurrenciesConverter(action.currencies);

  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      CurrenciesConverterModel data = currenciesConverterModelFromJson(response.data, action.currencies);

      // print("prueba2: "+data.length.toString());
      ReduxHome.store.dispatch(
        SetPostsStateActionHome(PostsStateHome(currenciesConverterModel: data)),
      );

      break;
    case AppSettings.statusCodeError:
      AlertWidget().message(action.context, response.message);

      break;
    default:
      AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getCurrencieHistory(NextDispatcher next, getCurrencieHistoryAction action, Store<AppState> store) async {
  var response = await API().getCurrenciesHistory(action.currencies);

  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      CurrenciesHistoryModel data = currenciesHistoryModelFromJson(response.data, action.currencies);

      ReduxHome.store.dispatch(
        SetPostsStateActionHome(PostsStateHome(currenciesHistoryModel: data)),
      );

      break;
    case AppSettings.statusCodeError:
      AlertWidget().message(action.context, response.message);

      break;
    default:
      AlertWidget().message(action.context, response.message);
  }
}

Future<void> _getCurrencies(NextDispatcher next, getCurrencieAction action, Store<AppState> store) async {
  var response = await API().getCurrencies();

  switch (response.statusCode) {
    case AppSettings.statusCodeSuccess:
      CurrenciesModel data = currenciesModelFromJson(response.data.toString());

      ReduxHome.store.dispatch(
        SetPostsStateActionHome(PostsStateHome(currenciesModel: data)),
      );

      break;
    case AppSettings.statusCodeError:
      AlertWidget().message(action.context, response.message);

      break;
    default:
      AlertWidget().message(action.context, response.message);
  }
}
