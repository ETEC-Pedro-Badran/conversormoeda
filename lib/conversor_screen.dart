import 'package:conversormoeda/moedas_rest.dart';
import 'package:flutter/material.dart';

class ConversorScreen extends StatefulWidget {
  const ConversorScreen({Key? key}) : super(key: key);

  @override
  _ConversorScreenState createState() => _ConversorScreenState();
}

class _ConversorScreenState extends State<ConversorScreen> {
  String moeda = "BRL";
  var moedas = [];

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
                //moedas = snapshot.data; ['results']['currencies'];

                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ));
                } else {
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
                            value: "BRL",
                            items: moedas
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: "BRL",
                                    child: Text("${moedas[0]}"),
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
}
