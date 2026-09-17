import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/loja.dart';
import 'tela_cardapio.dart';

class TelaLojas extends StatefulWidget {
  @override
  _TelaLojasState createState() => _TelaLojasState();
}

class _TelaLojasState extends State<TelaLojas> {
  ApiService servico = ApiService();
  late Future<List<Loja>> futuro_lojas;

  @override
  void initState() {
    super.initState();
    futuro_lojas = servico.pegarLojas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('Lojas')),
    body: FutureBuilder<List<Loja>>(
      future: futuro_lojas,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('nenhuma loja encontrada'));
        }

        var lojas = snapshot.data!;

        return ListView.builder(
        itemCount: lojas.length,
        itemBuilder: (context, indice) {
          var loja = lojas[indice];
          return ListTile(
          title: Text(loja.nome_loja),
          subtitle: Text(loja.endereco),
          onTap: () {
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TelaCardapio(loja.id_loja),
            ),
            );
          },
          );
        },
        );
      },
    ),
    );
  }
}
