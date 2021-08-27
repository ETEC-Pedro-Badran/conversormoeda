import 'dart:convert';

import 'package:conversormoeda/moedas_rest.dart';
import 'package:flutter/material.dart';

class ConversorScreen extends StatefulWidget {
  const ConversorScreen({Key? key}) : super(key: key);

  @override
  _ConversorScreenState createState() => _ConversorScreenState();
}

class _ConversorScreenState extends State<ConversorScreen> {
  String moeda = "Dollar";
  double cotacao = 0.0;
  var moedas = <String>[];
  var cotacoes = <double>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Conversor de Moeda"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Conversor de Moeda",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            FutureBuilder(
              future: MoedasRest().obterMoedas(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ));
                } else {
                  converterJson(snapshot.data as String);

                  return Container(
                    padding: EdgeInsets.all(30),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Valor em R\$(Real)',
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 6,
                          child: DropdownButton<String>(
                            value: moedas[0],
                            items: moedas
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: "$e",
                                    child: Text("$e"),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                moeda = value!;
                              });
                            },
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 10,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Valor em $moeda',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            )
          ],
        ));
  }

  void converterJson(String data) {
    Map<String, dynamic> json =
        JsonDecoder().convert(data) as Map<String, dynamic>;
    //imprime o tipo do valor da variável
    print(json.runtimeType);

    //obtem o valor da chave currencies dentro do valor da chave results
    var currencies = json['results']['currencies'];

    //itera pelo map. Ou seja, passa por todos as chaves encontradas em currencies que
    //é um Map<String,dynamic>
    currencies.forEach((k, v) {
      // para cada   chave e valor faça
      if (v.runtimeType != String) {
        // verificando se o valor é a string 'BRL',que não nos interessa

        moedas.add(
            v['name']); // apenas das moedas que irei converter - chave name
        cotacoes.add(v['buy']); // e o seu valor de compra - chave buy
      }
    });
  }
}
