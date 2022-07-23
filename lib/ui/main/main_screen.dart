import 'dart:async';

import 'package:pruebaTest/data/models/CountryList.dart';

import 'package:pruebaTest/data/networking/api.dart';
import 'package:pruebaTest/generated/l10n.dart';

import 'package:pruebaTest/app/app_constants.dart';
import 'package:pruebaTest/redux2/app/app_state.dart';
import 'package:pruebaTest/redux2/settingApp/settingsHomeActions.dart';
import 'package:pruebaTest/redux2/settingApp/store.dart';
import 'package:pruebaTest/redux2/store.dart';
import 'package:pruebaTest/routes/assets_routes.dart';

import 'package:pruebaTest/styles/colors.dart';
import 'package:pruebaTest/styles/style.dart';
import 'package:pruebaTest/test/testPage.dart';

import 'package:pruebaTest/utils/adapt_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:redux/redux.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redux/redux.dart';

//import 'package:sign_in_with_apple/sign_in_with_apple.dart';
//import 'package:google_sign_in/google_sign_in.dart';

import 'dart:convert';
import 'dart:math';

import 'dart:math';
import 'dart:ui';

import '../../styles/colors.dart';

class currenciesListPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  currenciesListPage({Key key}) : super(key: key);

  @override
  _currenciesListState createState() => _currenciesListState();
}

var _store;

class _currenciesListState extends State<currenciesListPage> {
  final bool revealWeather = false;
  String search = "";

  @override
  Widget build(BuildContext context) {
    AdaptScreen.initAdapt(context);

    return Scaffold(
      body: StoreProvider<AppStateHome>(
          //ReduxSignUp.store,
          store: ReduxHome.store,
          child: StoreConnector<AppStateHome, dynamic>(
              distinct: true,
              converter: (store) => store.state.postsState,
              onInit: (store) {
                _store = store;
              },
              builder: (context, value) {
                return RefreshIndicator(
                    onRefresh: () {
                      /*var action = RefreshItemsAction();
                  Redux.store
                      .dispatch(UpdateUserInfo(state.userState.user, action));
                  return action.completer.future;*/
                    },
                    child: Stack(children: <Widget>[
                      Positioned(top: -60.0, right: -35, child: _decorationBox()),
                      Container(
                        padding: EdgeInsets.all(15.0),
                      ),
                      ListView(
                        children: [
                          Container(
                            child: Center(
                              child: Image(
                                image: AssetImage(AssetsRoutes.loginIcon),
                                height: 200.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          ReduxHome.store.state.postsState.currenciesModel == null
                              ? Container(
                                  width: 100,
                                  height: 100,
                                  margin: EdgeInsets.all(180),
                                  child: CircularProgressIndicator(
                                    value: null,
                                    strokeWidth: 6.0,
                                  ))
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: ReduxHome.store.state.postsState.currenciesModel.toJson().length,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index) {
                                    String value =
                                        ReduxHome.store.state.postsState.currenciesModel.toJson().values.toList()[index].toString();
                                    String unid = ReduxHome.store.state.postsState.currenciesModel.toJson().keys.toList()[index].toString();
                                    return ListTile(
                                        leading: Icon(Icons.attach_money),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => homeTest(
                                                      currencie: unid,
                                                    )),
                                          );
                                        },
                                        trailing: Text(
                                          ReduxHome.store.state.postsState.currenciesModel.toJson().keys.toList()[index].toString(),
                                          style: TextStyle(color: Colors.green, fontSize: 15),
                                        ),
                                        title: Text(
                                            ReduxHome.store.state.postsState.currenciesModel.toJson().values.toList()[index].toString()));
                                  }),
                        ],
                      ),
                    ]));
              })),
      floatingActionButton: SpeedDial(
        marginEnd: 18,
        marginBottom: 20,

        icon: Icons.add,
        activeIcon: Icons.close,

        buttonSize: 60.0,
        visible: true,

        closeManually: false,

        renderOverlay: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: AppColors.mainColor,
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: CircleBorder(),
        // orientation: SpeedDialOrientation.Up,
        // childMarginBottom: 2,
        // childMarginTop: 2,
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
            label: "Recargar lista",
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              refreshList();
            },
          ),
        ],
      ),
    );
  }

  Widget _decorationBox() {
    return Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          height: 360.0,
          width: 360.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(colors: [
                AppColors.mainColor,
                AppColors.main2Color,
              ])),
        ));
  }

  refreshList() {
    asinc() async {
      Store<AppState> store = await createStore(api: API());

      store.dispatch(getCurrencieAction(context));
    }

    asinc();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshList();
  }
}

class RefreshItemsAction {
  final Completer<Null> completer;

  RefreshItemsAction({Completer completer}) : this.completer = completer ?? Completer<Null>();
}
