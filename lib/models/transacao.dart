class Transacao {
  int? id;
  late int tipo, conta;
  late String titulo, descricao, data;
  late double valor;

  Transacao.fromMap(Map map) {
    id = map['id'];
    tipo = map['tipo'];
    conta = map['conta'];
    titulo = map['titulo'];
    descricao = map['descricao'];
    data = map['data'];
    valor = map['valor'];
  }

  Transacao({
    this.id,
    required this.tipo,
    required this.conta,
    required this.titulo,
    required this.descricao,
    required this.data,
    required this.valor,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'tipo': tipo,
        'conta': conta,
        'titulo': titulo,
        'descricao': descricao,
        'data': data,
        'valor': valor,
      };
}
