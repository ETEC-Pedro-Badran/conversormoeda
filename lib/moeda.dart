class Moeda {
  String? nome;
  double? valor;

  fromJson(Map<String, String> json) {
    this.nome = json['nome'];
    this.valor = double.tryParse(json['bye']!);
  }
}
