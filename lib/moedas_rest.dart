import 'dart:convert';

import 'package:http/http.dart' as http;

class MoedasRest {
  Future<String> obterMoedas() async {
    var url = Uri.parse(
        "https://api.hgbrasil.com/finance?format=json-cors&key=300c77a7");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw 'erro obtendo cotação.';
    }
  }
}
