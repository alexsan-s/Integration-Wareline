import 'package:flutter/material.dart';
import 'package:integration_wl/model/build.dart';

class StockHome extends StatefulWidget {
  @override
  _StockHomeState createState() => _StockHomeState();
}

class _StockHomeState extends State<StockHome> {
  Build objBuild = Build();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text(
            'Estoque',
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
              objBuild.builButtonRB('Transferência entre estoque (C1)', 'C1')
            ],
          ),
        ),
        bottomNavigationBar: objBuild.buildVersion());
    ;
  }
}
