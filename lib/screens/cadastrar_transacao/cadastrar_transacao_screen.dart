import 'package:flutter/material.dart';
import 'package:my_contas/models/conta.dart';

class CadastratTransacaoScreen extends StatefulWidget {
  const CadastratTransacaoScreen({Key? key}) : super(key: key);

  @override
  _CadastratTransacaoScreenState createState() =>
      _CadastratTransacaoScreenState();
}

class _CadastratTransacaoScreenState extends State<CadastratTransacaoScreen> {
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _valorController = TextEditingController();
  final _dataController = TextEditingController();
  Conta? _contaSelecionada;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
