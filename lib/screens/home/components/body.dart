import 'package:flutter/material.dart';
import 'package:my_contas/screens/home/components/card_conta.dart';
import 'package:my_contas/services/conta_service.dart';
import 'package:my_contas/services/transacao_service.dart';

import 'card_transacao.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ContaService cs = ContaService();
  TransacaoService ts = TransacaoService();
  late Future<List> _loadContas;
  late Future<List> _loadTransacoes;
  late List _contas;
  late List _transacoes;

  @override
  void initState() {
    _loadContas = _getContas();
    _loadTransacoes = _getTransacoes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 175,
            child: FutureBuilder(
              future: _loadContas,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  _contas = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: _contas.length,
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    itemBuilder: (context, index) {
                      return cardConta(context, _contas[index]);
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Últimas Transações',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Ver Todas',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: _loadTransacoes,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _transacoes = snapshot.data as List;
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _transacoes.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return cardTransacao(context, index, _transacoes[index]);
                    },
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<List> _getContas() async {
    return await cs.getAllContas();
  }

  Future<List> _getTransacoes() async {
    return await ts.getAllTransacoes();
  }
}
