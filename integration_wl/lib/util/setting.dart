import 'dart:async';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:integration_wl/pages/stock_home.dart';
import 'package:integration_wl/util/query.dart';
import 'package:postgres/postgres.dart';
import 'package:preferences/preferences.dart';

class Setting {
  var conn;
  String underline = '';
  Query query = Query();

  Future database() async {
    try {
<<<<<<< HEAD
      db = PostgreSQLConnection(
=======
      // ignore: await_only_futures
      final connection = await PostgreSQLConnection(
<<<<<<< HEAD
>>>>>>> parent of c3b4d8b... login ok
=======
>>>>>>> parent of c3b4d8b... login ok
          PrefService.getString('host'),
          int.parse(PrefService.getString('port')),
          PrefService.getString('database'),
          username: PrefService.getString('username'),
          password: PrefService.getString('password'));
<<<<<<< HEAD
<<<<<<< HEAD
      return await db.open();
    } on PostgreSQLException {
      return PostgreSQLException;
    } on SocketException {
      return SocketException;
    } on TimeoutException {
      return TimeoutException;
    } on ArgumentError {
      return ArgumentError;
    } on FormatException {
      return FormatException;
    }
=======
=======
>>>>>>> parent of c3b4d8b... login ok
      return connection;
    } on PostgreSQLException {
      return "Não foi possível conectar ao banco de dados.";
    } catch (SocketException) {
      return "Host/Port inacessível";
    }
  }

  connection() async {
    conn = await database();
<<<<<<< HEAD
>>>>>>> parent of c3b4d8b... login ok
=======
>>>>>>> parent of c3b4d8b... login ok
  }

  open(TextEditingController operator, TextEditingController password,
      int module) async {
<<<<<<< HEAD
<<<<<<< HEAD
    var db = await database();
=======
    connection();
>>>>>>> parent of c3b4d8b... login ok
=======
    connection();
>>>>>>> parent of c3b4d8b... login ok
    switch (module) {
      case 12:
        var pw = convertSha256(password.text);
        var result = query.login(operator.text, pw.toString());
        print(result);
        try {
<<<<<<< HEAD
<<<<<<< HEAD
          List<List<dynamic>> row = await db.query('$result');
          print('oi');
          var codope;
          for (final row in row) {
            codope = row[0];
          }
          return await login(codope, module);
        } on PostgreSQLException {
          return 'erroDatabase';
        } on NoSuchMethodError {
          return 'erroDatabase';
=======
          List<List<dynamic>> row = await conn.query(result);
          print('aaaaaa');
        } on PostgreSQLException {
          print('Não foi conectado ao banco');
>>>>>>> parent of c3b4d8b... login ok
=======
          List<List<dynamic>> row = await conn.query(result);
          print('aaaaaa');
        } on PostgreSQLException {
          print('Não foi conectado ao banco');
>>>>>>> parent of c3b4d8b... login ok
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
<<<<<<< HEAD
<<<<<<< HEAD
    var result = query.module(underline, codope);
    List<List<dynamic>> row = await db.query('$result');
    var nomeope;
    for (final row in row) {
      nomeope = row[0];
    }
    return nomeope.toString();
  }

  movement(String type, int module) {
    switch (type) {
      case 'C1':
        underlineStr(module);
        var result =
            query.stock(underline, 2, PrefService.getString('operator'));
        break;
      default:
    }
=======
=======
>>>>>>> parent of c3b4d8b... login ok
    print(
        "select nomeope from cadope where podeusar like '${underline}1%' and nomeope like 'TESTE'");
    // List<List<dynamic>> teste = await conn.query(
    //     "select nomeope from cadope where podeusar like '${underline}1%' and nomeope like 'TESTE'");
    // for (final row in teste) {
    //   print(row[0]);
    // }
<<<<<<< HEAD
>>>>>>> parent of c3b4d8b... login ok
=======
>>>>>>> parent of c3b4d8b... login ok
  }
}

//   List<List<dynamic>> teste = await connection.query(
//       "select nomeope from cadope where podeusar like '${underline}1%' and nomeope like 'TESTE'");
//   for (final row in teste) {
//     print(row[0]);
//   }
// }
