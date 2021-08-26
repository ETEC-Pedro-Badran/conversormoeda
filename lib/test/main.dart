import 'dart:convert';

void main() {
  String cotacao =
      '{"by":"default","valid_key":true,"results":{"currencies":{"source":"BRL","USD":{"name":"Dollar","buy":5.211,"sell":5.2163,"variation":-0.97},"EUR":{"name":"Euro","buy":6.134,"sell":6.1419,"variation":-0.86},"GBP":{"name":"Pound Sterling","buy":7.171,"sell":null,"variation":-0.64},"ARS":{"name":"Argentine Peso","buy":0.053,"sell":null,"variation":-1.09},"CAD":{"name":"Canadian Dollar","buy":4.1438,"sell":null,"variation":0.0},"AUD":{"name":"Australian Dollar","buy":3.7949,"sell":null,"variation":-0.001},"JPY":{"name":"Japanese Yen","buy":0.0474,"sell":null,"variation":0.062},"CNY":{"name":"Renminbi","buy":0.8055,"sell":null,"variation":-0.002},"BTC":{"name":"Bitcoin","buy":270918.676,"sell":270918.676,"variation":0.617}},"stocks":{"IBOVESPA":{"name":"BM\u0026F BOVESPA","location":"Sao Paulo, Brazil","points":120817.71,"variation":0.5},"IFIX":{"name":"Índice de Fundos de Investimentos Imobiliários B3","location":"Sao Paulo, Brazil","points":2720.95,"variation":0.01},"NASDAQ":{"name":"NASDAQ Stock Market","location":"New York City, United States","points":15041.86,"variation":0.15},"DOWJONES":{"name":"Dow Jones Industrial Average","location":"New York City, United States","points":35405.5,"variation":0.11},"CAC":{"name":"CAC 40","location":"Paris, French","points":6676.48,"variation":0.18},"NIKKEI":{"name":"Nikkei 225","location":"Tokyo, Japan","points":27724.8,"variation":-0.03}},"available_sources":["BRL"],"bitcoin":{"blockchain_info":{"name":"Blockchain.info","format":["USD","en_US"],"last":49046.95,"buy":49046.95,"sell":49046.95,"variation":0.617},"coinbase":{"name":"Coinbase","format":["USD","en_US"],"last":49148.62,"variation":0.832},"bitstamp":{"name":"BitStamp","format":["USD","en_US"],"last":49117.49,"buy":49125.62,"sell":49107.29,"variation":0.772},"foxbit":{"name":"FoxBit","format":["BRL","pt_BR"],"last":257477.3,"variation":-0.084},"mercadobitcoin":{"name":"Mercado Bitcoin","format":["BRL","pt_BR"],"last":257956.63731,"buy":257957.68938,"sell":258269.32999,"variation":0.263}},"taxes":[{"date":"2021-08-24","cdi":5.25,"selic":5.25,"daily_factor":1.0001993,"selic_daily":5.15,"cdi_daily":5.15}]},"execution_time":0.0,"from_cache":true}';
  Map<String, dynamic> json =
      JsonDecoder().convert(cotacao) as Map<String, dynamic>;
  var currencies = json['results']['currencies'];
  var source = json['results']['currencies']['source'];

  var moedas = json['results']['currencies'];

  print(source);
  print(moedas);
}
