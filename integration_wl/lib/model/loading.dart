import 'package:flutter/material.dart';
import 'package:integration_wl/model/build.dart';
import 'package:integration_wl/util/setting.dart';
import 'package:preferences/preference_service.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();

  getFuture(TextEditingController operator, TextEditingController password,
      int module, BuildContext context) {
    return createState().myFuture();
  }
}

class _LoadingState extends State<Loading> {
  Build objBuild = Build();
  Setting setting = Setting();
  Future<bool> future;
  @override
  void initState() {
    super.initState();
  }

  Future<bool> myFuture() async {
    print('oi');
    await setting.database();
    var currentSeccond = DateTime.now().second;
    return currentSeccond.isEven;
  }

  Future teste(TextEditingController operator, TextEditingController password,
      int module, BuildContext context) async {
    var nomeope = await setting.open(operator, password, module);
    print('$nomeope');
    switch (nomeope) {
      case 'erroDatabase':
        objBuild.buildAlertDatabase(
            context, 'Não foi possível conectar ao banco de dados');
        break;
      case 'null':
        objBuild.buildAlertPermission(context, 'Operador sem permissão');
        break;
      default:
        PrefService.setString('operator', '$nomeope');
        Navigator.pushNamed(context, 'StockHome');
    }
  }

  @override
  Widget build(BuildContext context) {}
}
