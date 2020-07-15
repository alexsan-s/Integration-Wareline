import 'package:flutter/material.dart';
import 'package:integration_wl/pages/stock.dart';

import 'configuration.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Configuration()),
              );
              setState() {}
            },
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            RaisedButton(
              elevation: 10.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Stock()),
                );
              },
              disabledColor: Colors.white,
              child: Image.asset(
                'images/wl-module-stock.jpg',
                width: 100,
                alignment: Alignment.center,
              ),
            ),
          ],
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
