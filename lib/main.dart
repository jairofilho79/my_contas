import 'package:flutter/material.dart';
import 'package:my_contas/screens/cadastrar_conta/cadastrar_conta_screen.dart';
import 'package:my_contas/screens/home/home_screen.dart';

import 'screens/cadastrar_transacao/cadastrar_transacao_screen.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CadastrarTransacaoScreen(
        tipoTransacao: 1,
      ),
      // home: CadastrarContaScreen(),
      // home: HomeScreen(),
    );
  }
}
