import 'package:flutter/material.dart';
import 'package:integration_wl/pages/home.dart';
import 'package:preferences/preferences.dart';
import 'package:preferences/preference_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init(prefix: 'pref_');
  PrefService.setDefaultValues({'host': 'localhost'});
  PrefService.setDefaultValues({'port': '5432'});
  PrefService.setDefaultValues({'database': 'root'});
  PrefService.setDefaultValues({'username': 'admin'});
  PrefService.setDefaultValues({'password': 'admin'});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
