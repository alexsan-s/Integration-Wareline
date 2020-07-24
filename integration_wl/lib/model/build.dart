import 'package:flutter/material.dart';
import 'package:integration_wl/pages/stock.dart';
import 'package:integration_wl/util/setting.dart';
import 'package:preferences/preference_service.dart';

class Build {
  final TextEditingController operator = TextEditingController();
  final TextEditingController password = TextEditingController();
  Setting setting = Setting();

  // ignore: unused_element
  Container builOperatorTF(TextEditingController operator) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60,
      child: TextField(
        controller: operator,
        textCapitalization: TextCapitalization.characters,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            hintText: "Operador",
            prefixIcon: Icon(Icons.account_circle)),
      ),
    );
  }

  // ignore: unused_element
  Container buildPasswordTF(TextEditingController password) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60,
      child: TextField(
        controller: password,
        obscureText: true,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            hintText: "Senha",
            prefixIcon: Icon(Icons.lock)),
      ),
    );
  }

  // ignore: unused_element
  Container buildlLoginRB(TextEditingController operator,
      TextEditingController password, int module, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 10.0,
        disabledColor: Colors.grey,
        onPressed: () {
          FutureBuilder(
              future: teste(operator, password, module, context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: Text(
                      snapshot.data,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              });
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          "Login",
          style:
              TextStyle(color: Colors.red, letterSpacing: 1.5, fontSize: 20.0),
        ),
      ),
    );
  }

  Text buildVersion() {
    return Text(
      'Version 1.0',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
    );
  }

  RaisedButton builButtonRB(String text, String type, int module) {
    return RaisedButton(
      elevation: 10.0,
      onPressed: () {
        setting.movement(type, module);
      },
      disabledColor: Colors.white,
      child: Text('$text'),
    );
  }

  Future buildAlertPermission(BuildContext context, String error) {
    return showDialog(
        context: context,
        child: AlertDialog(
          backgroundColor: Colors.red[200],
          elevation: 9.0,
          title: Text(
            "Permissão",
            textAlign: TextAlign.center,
          ),
          content: Text(
            error,
            textAlign: TextAlign.center,
          ),
        ));
    ;
  }

  Future buildAlertDatabase(BuildContext context, String mensage) {
    return showDialog(
        context: context,
        child: AlertDialog(
          backgroundColor: Colors.red[200],
          elevation: 9.0,
          title: Text(
            "Conexão com o banco",
            textAlign: TextAlign.center,
          ),
          content: Text(
            mensage,
            textAlign: TextAlign.center,
          ),
        ));
  }

  Future teste(TextEditingController operator, TextEditingController password,
      int module, BuildContext context) async {
    var nomeope = await setting.open(operator, password, module);
    print('$nomeope');
    switch (nomeope) {
      case 'erroDatabase':
        buildAlertDatabase(
            context, 'Não foi possível conectar ao banco de dados');
        break;
      case 'null':
        buildAlertPermission(context, 'Operador sem permissão');
        break;
      default:
        PrefService.setString('operator', '$nomeope');
        Navigator.pushNamed(context, 'StockHome');
    }
  }
}
