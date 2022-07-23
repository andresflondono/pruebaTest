import 'package:pruebaTest/redux2/common_actions.dart';
import 'package:pruebaTest/redux2/settingApp/settingsHomeState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';

class getCurrencieAction extends ErrorAction {
  getCurrencieAction(BuildContext context) : super(context);
}

class getCurrencieConverterAction extends ErrorAction {
  getCurrencieConverterAction(BuildContext context, this.currencies) : super(context);

  final String currencies;
}

class getCurrencieHistoryAction extends ErrorAction {
  getCurrencieHistoryAction(BuildContext context, this.currencies) : super(context);

  final String currencies;
}

@immutable
class SetPostsStateActionHome {
  final PostsStateHome postsState;

  SetPostsStateActionHome(this.postsState);
}
