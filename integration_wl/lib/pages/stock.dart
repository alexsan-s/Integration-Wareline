import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:integration_wl/model/build.dart';

class Stock extends StatefulWidget {
  @override
  _StockState createState() => _StockState();
}

class _StockState extends State<Stock> {
  Build objBuild = Build();

  _builEmailTF() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60,
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            hintText: "Operador",
            prefixIcon: Icon(Icons.supervised_user_circle)),
      ),
    );
  }

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
                      SizedBox(height: 30.0),
                      objBuild.buildlLoginRB(operator, password, 1),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Text(
        'Version 1.0',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }
}
