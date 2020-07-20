import 'dart:async';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:integration_wl/util/query.dart';
import 'package:postgres/postgres.dart';
import 'package:preferences/preferences.dart';

class Setting {
  var db;
  String underline = '';
  Query query = Query();

  Future<void> database() async {
    try {
      var connection = PostgreSQLConnection(
          PrefService.getString('host'),
          int.parse(PrefService.getString('port')),
          PrefService.getString('database'),
          username: PrefService.getString('username'),
          password: PrefService.getString('password'));
      db = await connection.open();
    } on PostgreSQLException {
      db = PostgreSQLException;
    } on SocketException {
      db = SocketException;
    } on TimeoutException {
      db = TimeoutException;
    } on ArgumentError {
      db = ArgumentError;
    } on FormatException {
      db = FormatException;
    }
  }

  getDb() async {
    await database();
    return db;
  }

  open(TextEditingController operator, TextEditingController password,
      int module) async {
    await database();
    switch (module) {
      case 12:
        var pw = convertSha256(password.text);
        var result = query.login(operator.text, pw.toString());
        print(result.toString());
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
