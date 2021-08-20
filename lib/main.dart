import 'package:flutter/material.dart';

import 'conversor_screen.dart';

main() {
  runApp(ConversorMoeda());
}

class ConversorMoeda extends StatelessWidget {
  const ConversorMoeda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Conversor de Moeda",
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: ConversorScreen());
  }
}
