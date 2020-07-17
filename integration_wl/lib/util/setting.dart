import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:integration_wl/util/query.dart';
import 'package:postgres/postgres.dart';
import 'package:preferences/preferences.dart';

class Setting {
  var conn;
  String underline = '';
  Query query = Query();

  Future database() async {
    try {
      // ignore: await_only_futures
      final connection = await PostgreSQLConnection(
          PrefService.getString('host'),
          int.parse(PrefService.getString('port')),
          PrefService.getString('database'),
          username: PrefService.getString('username'),
          password: PrefService.getString('password'));
      return connection;
    } on PostgreSQLException {
      return "Não foi possível conectar ao banco de dados.";
    } catch (SocketException) {
      return "Host/Port inacessível";
    }
  }

  connection() async {
    conn = await database();
  }

  open(TextEditingController operator, TextEditingController password,
      int module) async {
    connection();
    switch (module) {
      case 12:
        var pw = convertSha256(password.text);
        var result = query.login(operator.text, pw.toString());
        try {
          List<List<dynamic>> row = await conn.query(result);
          print('aaaaaa');
        } on PostgreSQLException {
          print('Não foi conectado ao banco');
        }
        login(module);
        break;
      default:
    }
  }

  Digest convertSha256(String password) {
    Digest pw = sha256.convert(utf8.encode("$password"));
    return pw;
  }

// The method going to run for decripty.
  void underlineStr(int qtd) {
    underline = '';
    for (var i = 0; i < qtd; i++) {
      underline = underline + '_';
    }
  }

  login(int module) async {
    connection();
    underlineStr(module);
    print(
        "select nomeope from cadope where podeusar like '${underline}1%' and nomeope like 'TESTE'");
    // List<List<dynamic>> teste = await conn.query(
    //     "select nomeope from cadope where podeusar like '${underline}1%' and nomeope like 'TESTE'");
    // for (final row in teste) {
    //   print(row[0]);
    // }
  }
}

//   List<List<dynamic>> teste = await connection.query(
//       "select nomeope from cadope where podeusar like '${underline}1%' and nomeope like 'TESTE'");
//   for (final row in teste) {
//     print(row[0]);
//   }
// }
