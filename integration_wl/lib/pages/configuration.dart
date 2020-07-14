import 'package:flutter/material.dart';
import 'package:integration_wl/util/setting.dart';
import 'package:preferences/preferences.dart';

class Configuration extends StatefulWidget {
  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  var menssage = TextEditingController();
  Setting setting = Setting();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Configuração do banco de dados"),
        ),
        body: PreferencePage([
          PreferenceTitle("host"),
          TextFieldPreference('host', 'host'),
          PreferenceTitle("Port"),
          TextFieldPreference('port', 'port'),
          PreferenceTitle("Database"),
          TextFieldPreference('database', 'database'),
          PreferenceTitle("User"),
          TextFieldPreference('user', 'username'),
          PreferenceTitle("Password"),
          TextFieldPreference(
            'password',
            'password',
            obscureText: true,
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var temp = await setting.connection();
            menssage = TextEditingController(text: '$temp');
            print(temp);
            setState(() {});
          },
          child: Icon(Icons.assignment_turned_in),
        ),
        bottomNavigationBar: TextField(
          controller: menssage,
          textAlign: TextAlign.center,
        ));
  }
}
