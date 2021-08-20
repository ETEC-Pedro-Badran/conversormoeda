import 'package:flutter/material.dart';

class ConversorScreen extends StatefulWidget {
  const ConversorScreen({Key? key}) : super(key: key);

  @override
  _ConversorScreenState createState() => _ConversorScreenState();
}

class _ConversorScreenState extends State<ConversorScreen> {
  int? moeda = 0;
  var moedas = ['Real', 'US Dolar', 'Euro'];
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
            Container(
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
                    child: DropdownButton<int>(
                      value: moeda,
                      items: [
                        DropdownMenuItem(
                          value: 0,
                          child: Text("${moedas[0]}"),
                        ),
                        DropdownMenuItem(
                          value: 1,
                          child: Text("${moedas[1]}"),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text("${moedas[2]}"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          moeda = value;
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
                        labelText: 'Valor em ${moedas[moeda ?? 0]}',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
