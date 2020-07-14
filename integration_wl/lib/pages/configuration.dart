import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class Configuration extends StatefulWidget {
  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  static String host = PrefService.getString('host');
  static String port = PrefService.getString('port');
  static String database = PrefService.getString('database');
  static String username = PrefService.getString('username');
  static String password = PrefService.getString('password');

  var ted_host = TextEditingController(text: host);
  var ted_port = TextEditingController(text: port);
  var ted_database = TextEditingController(text: database);
  var ted_username = TextEditingController(text: username);
  var ted_password = TextEditingController(text: password);

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
            TextField(controller: ted_host),
            Text("Port"),
            TextField(controller: ted_port),
            Text("BD"),
            TextField(controller: ted_database),
            Text("Username"),
            TextField(controller: ted_username),
            Text("Password"),
            TextField(
              controller: ted_password,
              obscureText: true,
            ),
            FloatingActionButton(onPressed: connection())
          ],
        ));
  }

  connection() {
    print(ted_host);
    PrefService.setString('host', ted_host.toString());
    PrefService.setString('port', ted_port.toString());
    PrefService.setString('database', ted_database.toString());
    PrefService.setString('user', ted_username.toString());
    PrefService.setString('password', ted_password.toString());
  }
}
