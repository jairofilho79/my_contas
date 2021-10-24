class Conta {
  int? id;
  late String titulo;
  late double saldo;

  Conta({this.id, required this.titulo, required this.saldo});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'saldo': saldo,
    };
  }

  Conta.fromMap(Map map) {
    id = map['id'];
    titulo = map['titulo'];
    saldo = map['saldo'];
  }
}
