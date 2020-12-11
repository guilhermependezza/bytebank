import '../models/transferencia.dart';
import 'package:flutter/material.dart';
import 'formulario_transferencia.dart';

class ListaTransferencias extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  final List<Transferencia> _transferencias = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = _transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      appBar: AppBar(
          title: Text('Transferências')
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }));

            future.then((transferenciaRecebida) {
              if(transferenciaRecebida != null) {
                Future.delayed(Duration( milliseconds: 300 ), () {
                  setState(() {
                    _transferencias.add(transferenciaRecebida);
                  });
                });
              }
            });
          },
          child: Icon(Icons.add)
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia) { }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString()),
        )
    );
  }
}