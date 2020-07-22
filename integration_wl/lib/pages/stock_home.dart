import 'package:flutter/material.dart';
import 'package:integration_wl/model/build.dart';
import 'package:preferences/preference_service.dart';

class StockHome extends StatefulWidget {
  @override
  _StockHomeState createState() => _StockHomeState();
}

class _StockHomeState extends State<StockHome> {
  String operator = PrefService.getString('operator');
  Build objBuild = Build();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text(
            'Estoque - $operator',
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          color: Colors.white,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              objBuild.builButtonRB(
                  'Transferência entre estoques (C1)', 'C1', 1583)
            ],
          ),
        ),
        bottomNavigationBar: objBuild.buildVersion());
    ;
  }
}
