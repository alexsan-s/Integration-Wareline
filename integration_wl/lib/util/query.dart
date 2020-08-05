class Query {
  String login(String operator, String password) {
<<<<<<< HEAD
    return """SELECT co2.codope FROM cadope2 cO2 LEFT JOIN cadope co ON co2.codope = co.codope WHERE co.username LIKE '$operator' AND co2.senha = '$password' """;
  }

  String module(var underline, String codope) {
    return """SELECT nomeope FROM cadope WHERE podeusar LIKE '${underline}1%' AND codope LIKE '$codope'""";
  }

  String stock(String underline, int op, String codope) {
    return """SELECT nomeope FROM cadope WHERE podeusar LIKE '$underline$op%' AND codope LIKE '$codope'""";
=======
    return """
    SELECT co2.codope 
    FROM cadope2 cO2 
    LEFT JOIN cadope co ON co2.codope = co.codope 
    WHERE co.username LIKE '$operator' AND 
    co2.senha = '$password' """;
>>>>>>> parent of c3b4d8b... login ok
  }
}
