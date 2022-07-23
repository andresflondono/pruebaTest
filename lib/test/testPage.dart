import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pruebaTest/routes/assets_routes.dart';
import 'package:pruebaTest/styles/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:pruebaTest/redux2/settingApp/settingsHomeActions.dart';
import 'package:pruebaTest/test/testPage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';

import 'package:pruebaTest/app/app_settings.dart';
import 'package:pruebaTest/data/models/CountryList.dart';

import 'package:pruebaTest/data/networking/api.dart';
import 'package:pruebaTest/redux2/app/app_state.dart';
import 'package:pruebaTest/redux2/settingApp/settingsHomeState.dart';
import 'package:pruebaTest/redux2/settingApp/store.dart';
import 'package:pruebaTest/redux2/store.dart';
import 'package:pruebaTest/utils/alert.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class homeTest extends StatefulWidget {
  homeTest({this.currencie});

  final String currencie;

  @override
  _homeTestState createState() => _homeTestState();
}

class _homeTestState extends State<homeTest> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    asinc() async {
      Store<AppState> store = await createStore(api: API());

      store.dispatch(getCurrencieHistoryAction(context, widget.currencie));
      store.dispatch(getCurrencieConverterAction(context, widget.currencie));
    }

    asinc();
  }

  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  var _store;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StoreProvider<AppStateHome>(
            //ReduxSignUp.store,
            store: ReduxHome.store,
            child: StoreConnector<AppStateHome, dynamic>(
                distinct: true,
                converter: (store) => store.state.postsState,
                onInit: (store) {
                  _store = store;
                },
                builder: (context, value) {
                  if (ReduxHome.store.state.postsState.currenciesHistoryModel != null) {
                    data.clear();
                    //      print("prueba57: " + ReduxHome.store.state.postsState.currenciesHistoryModel.rates);

                    if (ReduxHome.store.state.postsState.currenciesHistoryModel.rates != null) {
                      for (var i = 0; i < ReduxHome.store.state.postsState.currenciesHistoryModel.rates.length; i++) {
                        double value = ReduxHome.store.state.postsState.currenciesHistoryModel.rates.values.toList()[i].usd;
                        String name = ReduxHome.store.state.postsState.currenciesHistoryModel.rates.keys.toList()[i].toString();

                        data.add(_SalesData(name, value));
                      }
                    }
                  }

                  return Scaffold(
                      body: RefreshIndicator(
                          onRefresh: () {},
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Stack(children: <Widget>[
                              Positioned(top: -200.0, right: -35, child: _decorationBox()),
                              Container(
                                padding: EdgeInsets.all(15.0),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 130,
                                  ),
                                  Text(
                                    "Convertidor",
                                    style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ReduxHome.store.state.postsState.currenciesConverterModel == null
                                      ? Text("")
                                      : ListTile(
                                          title: Text("From: " +
                                              ReduxHome.store.state.postsState.currenciesConverterModel.amount.toString() +
                                              " " +
                                              ReduxHome.store.state.postsState.currenciesConverterModel.base.toString()),
                                          subtitle: Text("To: " +
                                              ReduxHome.store.state.postsState.currenciesConverterModel.rates.usd.toString() +
                                              " " +
                                              "USD"),
                                        ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Historial",
                                    style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      // Chart title

                                      // Enable legend
                                      legend: Legend(isVisible: true),
                                      // Enable tooltip
                                      tooltipBehavior: TooltipBehavior(enable: true),
                                      series: <ChartSeries<_SalesData, String>>[
                                        LineSeries<_SalesData, String>(
                                            dataSource: data,
                                            xValueMapper: (_SalesData sales, _) => sales.year,
                                            yValueMapper: (_SalesData sales, _) => sales.sales,
                                            name: 'Sales',
                                            // Enable data label
                                            dataLabelSettings: DataLabelSettings(isVisible: true))
                                      ]),
                                ],
                              )
                            ]),
                          )));
                })));
  }

  Widget _decorationBox() {
    return Transform.rotate(
        angle: -100 / 5.0,
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
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
