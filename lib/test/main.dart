import 'dart:convert';

void main() {
  String cotacao =
      '{"by":"default","valid_key":true,"results":{"currencies":{"source":"BRL","USD":{"name":"Dollar","buy":5.196,"sell":5.205,"variation":-1.17},"EUR":{"name":"Euro","buy":6.128,"sell":6.1401,"variation":-0.81},"GBP":{"name":"Pound Sterling","buy":7.15,"sell":null,"variation":-0.68},"ARS":{"name":"Argentine Peso","buy":0.053,"sell":null,"variation":-1.19},"CAD":{"name":"Canadian Dollar","buy":4.1259,"sell":null,"variation":-0.418},"AUD":{"name":"Australian Dollar","buy":3.8062,"sell":null,"variation":0.084},"JPY":{"name":"Japanese Yen","buy":0.0474,"sell":null,"variation":-0.661},"CNY":{"name":"Renminbi","buy":0.8043,"sell":null,"variation":-0.807},"BTC":{"name":"Bitcoin","buy":269221.787,"sell":269221.787,"variation":3.347}},"stocks":{"IBOVESPA":{"name":"BM\u0026F BOVESPA","location":"Sao Paulo, Brazil","points":120677.6,"variation":1.65},"IFIX":{"name":"Índice de Fundos de Investimentos Imobiliários B3","location":"Sao Paulo, Brazil","points":2731.21,"variation":0.28},"NASDAQ":{"name":"NASDAQ Stock Market","location":"New York City, United States","points":15129.5,"variation":1.23},"DOWJONES":{"name":"Dow Jones Industrial Average","location":"New York City, United States","points":35455.8,"variation":0.69},"CAC":{"name":"CAC 40","location":"Paris, French","points":6681.92,"variation":0.24},"NIKKEI":{"name":"Nikkei 225","location":"Tokyo, Japan","points":27641.14,"variation":-0.36}},"available_sources":["BRL"],"bitcoin":{"blockchain_info":{"name":"Blockchain.info","format":["USD","en_US"],"last":48880.45,"buy":48880.45,"sell":48880.45,"variation":3.347},"coinbase":{"name":"Coinbase","format":["USD","en_US"],"last":48728.37,"variation":3.105},"bitstamp":{"name":"BitStamp","format":["USD","en_US"],"last":48855.95,"buy":48877.85,"sell":48851.26,"variation":3.432},"foxbit":{"name":"FoxBit","format":["BRL","pt_BR"],"last":255597.89,"variation":1.532},"mercadobitcoin":{"name":"Mercado Bitcoin","format":["BRL","pt_BR"],"last":256650.0,"buy":256000.00005,"sell":256489.3,"variation":2.251}},"taxes":[{"date":"2021-08-26","cdi":5.25,"selic":5.25,"daily_factor":1.0001993,"selic_daily":5.15,"cdi_daily":5.15}]},"execution_time":0.0,"from_cache":true}';

  Map<String, dynamic> json =
      JsonDecoder().convert(cotacao) as Map<String, dynamic>;
  print(json.runtimeType);

  //var currencies = json['results']['currencies'];
  //var source = currencies['source'];
  //print(source);
  var moedas = json['results']['currencies'];

  print(moedas);

  var chaves = <String>[];
  var valores = <dynamic>[];

  moedas.forEach((k, v) {
    //print("$k - $v");
    if (v.runtimeType != String) {
      //print(v['buy']);
      chaves.add(v['name']);
      valores.add(v['buy']);
    }
  });

  print("Lista de chaves : $chaves");
  print("Lista de valores : $valores");
}
