import 'dart:math';

import 'package:pruebaTest/generated/l10n.dart';

import 'package:pruebaTest/routes/assets_routes.dart';
import 'package:pruebaTest/styles/colors.dart';
import 'package:pruebaTest/ui/main/main_screen.dart';
import 'package:pruebaTest/utils/adapt_screen.dart';
import 'package:pruebaTest/utils/alert.dart';
import 'package:pruebaTest/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  Utils utils = Utils();
  bool changePage = true;
  String email;
  String password;
  Widget _decorationBox() {
    return Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          height: 360.0,
          width: 370.0,
          child: Container(
            child: Transform.rotate(
              angle: 26,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Center(
                      child: Image(
                        image: AssetImage(AssetsRoutes.loginIcon),
                        height: 200.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(colors: [
                Colors.white,
                Colors.white,
              ])),
        ));
  }

  final _ediUser = TextEditingController();
  final _ediPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(colors: [
            AppColors.main2Color,
            AppColors.mainColor,
          ])),
      child: Stack(children: <Widget>[
        Positioned(top: -60.0, right: -35, child: _decorationBox()),
        Container(
          padding: EdgeInsets.all(15.0),
        ),
        ListView(),
        Positioned(
            top: AdaptScreen.screenHeight() * 0.48,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        width: 300,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[100]))),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value.isEmpty) {
                              return AppLocalizations.of(context).requiredfield;
                            }
                            return null;
                          },
                          controller: _ediUser,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: AppLocalizations.of(context).user,
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 300,
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value.isEmpty) {
                              return AppLocalizations.of(context).requiredfield;
                            }
                            return null;
                          },
                          obscureText: true,
                          controller: _ediPassword,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: AppLocalizations.of(context).password,
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _submitButtom(context)
                    ],
                  ),
                ))),
      ]),
    ));
  }

  Widget _submitButtom(BuildContext context) {
    return RaisedButton(
        elevation: 0,
        child: Container(
          margin: EdgeInsets.only(left: 20),
          padding: EdgeInsets.symmetric(horizontal: 120, vertical: 30.0),
          child: Text(AppLocalizations.of(context).run, style: TextStyle(color: AppColors.mainColor, fontSize: 20.0)),
        ),
        color: Colors.white,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            if (_ediPassword.text == "1234" && _ediUser.text == "admin") {
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (context) => currenciesListPage()), ModalRoute.withName("/Home"));
            } else {
              AlertWidget().message(context, "Datos incorrectos");
            }
          }
        });
  }
}
