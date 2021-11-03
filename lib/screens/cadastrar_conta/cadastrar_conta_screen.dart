import 'package:flutter/material.dart';
import 'package:my_contas/models/conta.dart';
import 'package:my_contas/screens/home/home_screen.dart';
import 'package:my_contas/services/conta_service.dart';

class CadastrarContaScreen extends StatelessWidget {
  final _tituloController = TextEditingController();
  final _saldoController = TextEditingController();
  final ContaService cs = ContaService();

  CadastrarContaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Cadastro de conta'), backgroundColor: Colors.blue),
      body: SingleChildScrollView(
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
                  controller: _saldoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Saldo'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue)),
                      child: const Text('Cadastrar'),
                      onPressed: () {
                        Conta newConta = Conta(
                          titulo: _tituloController.text,
                          saldo: double.tryParse(_saldoController.text) ?? 0,
                        );
                        cs.addConta(newConta);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const HomeScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
