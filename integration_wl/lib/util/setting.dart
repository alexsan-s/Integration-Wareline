import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:integration_wl/util/query.dart';
import 'package:postgres/postgres.dart';
import 'package:preferences/preferences.dart';

class Setting {
  var db;
  String underline = '';
  Query query = Query();

  Future database() async {
    try {
      // ignore: await_only_futures
      db = await PostgreSQLConnection(
          PrefService.getString('host'),
          int.parse(PrefService.getString('port')),
          PrefService.getString('database'),
          username: PrefService.getString('username'),
          password: PrefService.getString('password'));
      await db.open();
      return db;
    } on PostgreSQLException {
      return "Não foi possível conectar ao banco de dados.";
    } catch (SocketException) {
      return "Host/Port inacessível";
    }
  }

  connection() async {
    try {
      var conn = await database();
    } on PostgreSQLException {
      print('sorry, too many clients already');
    }
  }

  open(TextEditingController operator, TextEditingController password,
      int module) async {
    await database();
    switch (module) {
      case 12:
        var pw = convertSha256(password.text);
        var result = query.login(operator.text, pw.toString());
        try {
          List<List<dynamic>> row = await db.query('$result');
          var codope;
          for (final row in row) {
            codope = row[0];
          }
          login(codope, module);
        } on PostgreSQLException {
          print('Não foi conectado ao banco');
        } on NoSuchMethodError {
          print('NoSuchMethodError');
        }
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

  login(var codope, int module) async {
    // connection();
    underlineStr(module);
    var result = query.module(underline, codope);
    print(result);
    List<List<dynamic>> row = await db.query('$result');
    var nomeope;
    for (final row in row) {
      nomeope = row[0];
    }
    print(nomeope);
  }
}
