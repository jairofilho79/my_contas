import 'package:flutter/material.dart';
import 'package:my_contas/models/conta.dart';

Widget cardConta(BuildContext context, Conta conta) {
  return InkWell(
    onTap: () {},
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
            color: Color(0x00100000),
            blurRadius: 10,
            spreadRadius: 4,
            offset: Offset(0, 8),
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 14,
            right: 12,
            child: Text(
              conta.titulo,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          const Positioned(
            top: 63,
            left: 16,
            child: Text(
              'Saldo em conta',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 81,
            left: 16,
            child: Text(
              'R\$ ' + conta.saldo.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
