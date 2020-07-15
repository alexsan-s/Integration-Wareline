import 'package:flutter/cupertino.dart';
import 'package:postgres/postgres.dart';
import 'package:preferences/preferences.dart';

class Setting {
  var conn;
  String underline = '';
  Future connection() async {
    var connection = await PostgreSQLConnection(
        PrefService.getString('host'),
        int.parse(PrefService.getString('port')),
        PrefService.getString('database'),
        username: PrefService.getString('username'),
        password: PrefService.getString('password'));

    try {
      conn = await connection.open();
      if (conn == null) {
        return conn;
      } else {
        return conn;
      }
    } on PostgreSQLException {
      return "Não foi possível conectar ao banco de dados.";
    } catch (SocketException) {
      return conn;
    }
  }

// The method going to run for decripty.
  void underlineStr(int qtd) {
    for (var i = 0; i < qtd; i++) {
      underline = underline + '_';
    }
  }

  login() {}

  //   var underline = '';

  //   for (var i = 0; i < 1351; i++) {
  //     underline = underline + '_';
  //   }
  //   List<List<dynamic>> teste = await connection.query(
  //       "select nomeope from cadope where podeusar like '${underline}1%' and nomeope like 'TESTE'");
  //   for (final row in teste) {
  //     print(row[0]);
  //   }
  // }
}
