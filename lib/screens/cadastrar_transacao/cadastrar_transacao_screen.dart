import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:my_contas/models/conta.dart';
import 'package:my_contas/services/conta_service.dart';

class CadastrarTransacaoScreen extends StatefulWidget {
  final int tipoTransacao;
  const CadastrarTransacaoScreen({Key? key, required this.tipoTransacao})
      : super(key: key);

  @override
  _CadastrarTransacaoScreenState createState() =>
      _CadastrarTransacaoScreenState();
}

class _CadastrarTransacaoScreenState extends State<CadastrarTransacaoScreen> {
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _valorController = TextEditingController();
  final _dataController = TextEditingController();
  Conta? _contaSelecionada;
  ContaService cs = ContaService();
  late Future<List> _loadContas;
  late List<Conta> _contas;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    _loadContas = _getContas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de transação'),
        backgroundColor: widget.tipoTransacao == 1 ? Colors.blue : Colors.red,
      ),
      body: FutureBuilder(
        future: _loadContas,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            _contas = snapshot.data;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _tituloController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(labelText: 'Título'),
                      ),
                      TextFormField(
                        controller: _descricaoController,
                        keyboardType: TextInputType.text,
                        decoration:
                            const InputDecoration(labelText: 'Descrição'),
                      ),
                      TextFormField(
                        controller: _valorController,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: 'R\$ 00,00'),
                      ),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: _dataController,
                            decoration: InputDecoration(
                              labelText: formatDate(
                                selectedDate,
                                [dd, '/', mm, '/', yyyy],
                              ),
                            ),
                          ),
                        ),
                      ),
                      DropdownButtonFormField(
                        value: _contaSelecionada,
                        onChanged: (Conta? conta) {
                          setState(() {
                            _contaSelecionada = conta;
                          });
                        },
                        items: _contas.map((conta) {
                          return DropdownMenuItem<Conta>(
                            value: conta,
                            child: Text(conta.titulo),
                          );
                        }).toList(),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            widget.tipoTransacao == 1
                                ? Colors.blue
                                : Colors.red,
                          ),
                        ),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2018, 01),
      lastDate: DateTime(2030, 01),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<List> _getContas() async {
    return await cs.getAllContas();
  }
}
