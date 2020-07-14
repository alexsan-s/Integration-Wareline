import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Configuration extends StatefulWidget {
  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Configuração do banco de dados"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Host"),
            Text("BD"),
            Text("Username"),
            Text("Password"),
          ],
        ));
  }
}
