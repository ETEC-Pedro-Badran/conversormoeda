import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MoedasRest {
  obterMoedas() async {
    var url = Uri.parse(
        "https://api.hgbrasil.com/finance?format=json-cors&key=300c77a7");

    var response = await http.get(url);
    Map<String, dynamic>? moedas;
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          JsonDecoder().convert(response.body) as Map<String, dynamic>;
      //var source = json['results']['currencies']['source'];
      var moedas = json['results']['currencies'];
      print(moedas);
      return moedas;
    } else {
      throw 'erro obtendo cotação.';
    }
  }
}
