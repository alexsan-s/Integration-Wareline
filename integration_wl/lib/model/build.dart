import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:integration_wl/util/setting.dart';

class Build {
  final TextEditingController operator = TextEditingController();
  final TextEditingController password = TextEditingController();

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

  open(TextEditingController operator, TextEditingController password,
      int module) {
    switch (module) {
      case 12:
        Setting st = Setting();
        print(operator.text);
        print(password.text);
        print(md5.convert(utf8.encode(password.text)));
        st.login(module);
        break;
      default:
    }
  }

  // ignore: unused_element
  Container buildlLoginRB(TextEditingController operator,
      TextEditingController password, int module) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 10.0,
        disabledColor: Colors.grey,
        onPressed: () {
          open(operator, password, module);
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
          fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
    );
  }
}
