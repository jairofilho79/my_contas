import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:my_contas/screens/cadastrar_conta/cadastrar_conta_screen.dart';
import 'package:my_contas/screens/cadastrar_transacao/cadastrar_transacao_screen.dart';

SpeedDial buildSpeedDial(BuildContext context) {
  return SpeedDial(
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: const IconThemeData(size: 22),
    children: [
      SpeedDialChild(
        label: "Entrada",
        labelStyle: const TextStyle(
          backgroundColor: Colors.green,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        labelBackgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.green,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const CadastrarTransacaoScreen(tipoTransacao: 1),
            ),
          );
        },
      ),
      SpeedDialChild(
        label: "Saída",
        labelStyle: const TextStyle(
          backgroundColor: Colors.red,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        labelBackgroundColor: Colors.red,
        child: const Icon(Icons.remove, color: Colors.white),
        backgroundColor: Colors.red,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const CadastrarTransacaoScreen(tipoTransacao: 2),
            ),
          );
        },
      ),
      SpeedDialChild(
        label: "Saída",
        labelStyle: const TextStyle(
          backgroundColor: Colors.blue,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        labelBackgroundColor: Colors.blue,
        child: const Icon(Icons.account_balance, color: Colors.white),
        backgroundColor: Colors.blue,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CadastrarContaScreen(),
            ),
          );
        },
      ),
    ],
  );
}
