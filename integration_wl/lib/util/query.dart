class Query {
  String login(String operator, String password) {
    return """
    SELECT co2.codope 
    FROM cadope2 cO2 
    LEFT JOIN cadope co ON co2.codope = co.codope 
    WHERE co.username LIKE '$operator' AND 
    co2.senha = '$password' """;
  }
}
