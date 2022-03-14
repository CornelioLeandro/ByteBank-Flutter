import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("AppCouro")),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
              child: TextField(
                controller: _controladorCampoNumeroConta,
                style: TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                    labelText: 'Numero da conta',
                    hintText: '000'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0, 8.0, 0),
              child: TextField(
                controller: _controladorCampoValor,
                style: TextStyle(fontSize: 16),
                decoration: const InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Valor',
                    hintText: 'Digite o valor desejado'),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              child: const Text("Confirmar"),
              onPressed: () {
                criaTransferencia(context);
              },
            ),
          ],
        ));
  }

  void criaTransferencia(BuildContext context) {
    final int? numeroConta =
        int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor =
        double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      debugPrint('Criando Transferencia');
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Couro"),
      ),
      body: Column(children: <Widget>[
        ItemTransferencia(Transferencia(200.0, 101)),
        ItemTransferencia(Transferencia(1000.0, 201)),
        ItemTransferencia(Transferencia(500.0, 301)),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future = Navigator.push(context, MaterialPageRoute(builder: (context){
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint('Chegou no them do future');
            debugPrint('$transferenciaRecebida');
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
