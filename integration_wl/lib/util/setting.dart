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
  var db;
  String underline = '';
  Query query = Query();

  Future database() async {
    try {
      db = PostgreSQLConnection(
          PrefService.getString('host'),
          int.parse(PrefService.getString('port')),
          PrefService.getString('database'),
          username: PrefService.getString('username'),
          password: PrefService.getString('password'));
      return await db.open();
    } on PostgreSQLException {
      print(PostgreSQLException);
      return PostgreSQLException;
    } on SocketException {
      print(SocketException);
      return SocketException;
    } on TimeoutException {
      print(TimeoutException);
      return TimeoutException;
    } on ArgumentError {
      print(ArgumentError);
      return ArgumentError;
    } on FormatException {
      print(FormatException);
      return FormatException;
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
          return await login(codope, module);
        } on PostgreSQLException {
          print('Não foi conectado ao banco');
        } on NoSuchMethodError {
          print(NoSuchMethodError);
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

        break;
      default:
    }
  }
}
