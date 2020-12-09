import 'package:flutter/material.dart';

void main() => runApp(Bytebank());

class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FormularioTransferencia()
    );
  }

}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando transferência'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: TextField(
              controller: _controladorNumeroConta,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24.0
              ),
              decoration: InputDecoration(
                labelText: 'Numero da conta',
                hintText: '0000'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _controladorValor,
              style: TextStyle(
                  fontSize: 24.0
              ),
              decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '0.00'
              ),
            ),
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () {
              debugPrint('clicou no confirmar');
              final int numeroConta = int.tryParse(_controladorNumeroConta.text);
              final double valor = double.tryParse(_controladorValor.text);
              if(numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
              }
            },
          )
        ],
      )
    );
  }
}

// 3.6

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ItemTransferencia('100.0', '1002'),
          ItemTransferencia('100.0', '1000'),
          ItemTransferencia('100.0', '1000'),
          ItemTransferencia('100.0', '1000'),
        ],
      ),
      appBar: AppBar(
          title: Text('Transferências')
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add)
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final String valor;
  final String numeroConta;

  ItemTransferencia(this.valor, this.numeroConta) { }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text('100.0'),
          subtitle: Text('1000'),
        )
    );
  }
}
