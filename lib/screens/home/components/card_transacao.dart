import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:my_contas/models/transacao.dart';

Widget cardTransacao(BuildContext context, int index, Transacao transacao) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
    height: 68,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [
        BoxShadow(
          color: Color(0x00400000),
          blurRadius: 10,
          spreadRadius: 10,
          offset: Offset(0, 8),
        ),
      ],
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  transacao.titulo,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: transacao.tipo == 1 ? Colors.green : Colors.red,
                  ),
                ),
                Text(
                  transacao.descricao,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "R\$ " + transacao.valor.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  formatDate(
                    DateTime.parse(transacao.data),
                    [dd, '/', mm, '/', yyyy],
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}
