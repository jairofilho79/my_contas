import 'package:flutter/material.dart';
import 'package:my_contas/screens/cadastrar_conta/cadastrar_conta_screen.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CadastrarContaScreen(),
    );
  }
}
