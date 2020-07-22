import 'package:flutter/material.dart';
import 'package:integration_wl/pages/home.dart';
import 'package:integration_wl/pages/stock_home.dart';
import 'package:preferences/preferences.dart';
import 'package:preferences/preference_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init(prefix: 'pref_');
  PrefService.setDefaultValues({'host': '192.168.254.4'});
  PrefService.setDefaultValues({'port': '5432'});
  PrefService.setDefaultValues({'database': 'dbteste'});
  PrefService.setDefaultValues({'username': 'TI'});
  PrefService.setDefaultValues({'password': 'T3cnologia20'});
  PrefService.setDefaultValues({'operator': 'root'});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wareline',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
        routes: {
          'StockHome': (context) => StockHome(),
        });
  }
}
