import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integration_wl/model/build.dart';
import 'package:integration_wl/util/setting.dart';
import 'package:postgres/postgres.dart';
import 'package:preferences/preferences.dart';

class Configuration extends StatefulWidget {
  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  Setting setting = Setting();
  Build objBuild = Build();
  String loading = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuração do banco de dados"),
      ),
      body: PreferencePage([
        PreferenceTitle("Host"),
        TextFieldPreference('Host', 'host'),
        PreferenceTitle("Port"),
        TextFieldPreference('port', 'port'),
        PreferenceTitle("Database"),
        TextFieldPreference('Database', 'database'),
        PreferenceTitle("User"),
        TextFieldPreference('User', 'username'),
        PreferenceTitle("Password"),
        TextFieldPreference(
          'Password',
          'password',
          obscureText: true,
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await temp();
          objBuild.buildAlertDatabase(context, loading);
        },
        child: Icon(Icons.check_circle),
      ),
    );
  }

  Future temp() async {
    var temp = await setting.database();
    loading = temp.toString();
    setState(() {});
  }
}
