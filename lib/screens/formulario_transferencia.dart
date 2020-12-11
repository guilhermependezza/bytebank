import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  void _criaTransferencia(context) {
    final int numeroConta = int.tryParse(_controladorNumeroConta.text);
    final double valor = double.tryParse(_controladorValor.text);
    if(numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando transferência'),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Editor(
                    controlador: _controladorNumeroConta,
                    rotulo: 'Numero da conta',
                    dica: '0000'
                ),
                Editor(
                    controlador: _controladorValor,
                    rotulo: 'Valor',
                    dica: '0.00',
                    icone: Icons.monetization_on
                ),
                RaisedButton(
                  child: Text('Confirmar'),
                  onPressed: () => _criaTransferencia(context),
                )
              ],
            )
        )
    );
  }
}