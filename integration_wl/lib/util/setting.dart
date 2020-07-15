import 'package:postgres/postgres.dart';
import 'package:preferences/preferences.dart';

class Setting {
  Future<String> connection() async {
    var connection = await PostgreSQLConnection(
        PrefService.getString('host'),
        int.parse(PrefService.getString('port')),
        PrefService.getString('database'),
        username: PrefService.getString('username'),
        password: PrefService.getString('password'));

    try {
      if (await connection.open() == null) return "Conectado com sucesso.";
    } on PostgreSQLException {
      return "Não foi possível conectar ao banco de dados.";
    } catch (SocketException) {
      return "Host/Port inacessível";
    }
  }

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
