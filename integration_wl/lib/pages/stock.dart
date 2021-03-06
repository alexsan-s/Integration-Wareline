import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:integration_wl/model/build.dart';

class Stock extends StatefulWidget {
  @override
  _StockState createState() => _StockState();
}

class _StockState extends State<Stock> {
  Build objBuild = Build();

  @override
  Widget build(BuildContext context) {
    final TextEditingController operator = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Scaffold(
        appBar: AppBar(),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Acessar',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30.0),
                        objBuild.builOperatorTF(operator),
                        SizedBox(height: 30.0),
                        objBuild.buildPasswordTF(password),
                        SizedBox(height: 40.0),
                        objBuild.buildlLoginRB(operator, password, 12, context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: objBuild.buildVersion());
  }
}
