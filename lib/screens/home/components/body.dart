import 'package:flutter/material.dart';
import 'package:my_contas/services/conta_service.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ContaService cs = ContaService();
  late Future<List> _loadContas;

  @override
  void initState() {
    _loadContas = _getContas();
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
          )
        ],
      ),
    );
  }

  Future<List> _getContas() async {
    return await cs.getAllContas();
  }
}
