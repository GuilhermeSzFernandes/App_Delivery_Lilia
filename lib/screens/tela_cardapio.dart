import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/cardapio.dart';

class TelaCardapio extends StatefulWidget {
  int id_loja;

  TelaCardapio(this.id_loja);

  @override
  _TelaCardapioState createState() => _TelaCardapioState();
}

class _TelaCardapioState extends State<TelaCardapio> {
  ApiService servico = ApiService();
  late Future<List<Cardapio>> futuro_cardapios;

  @override
  void initState() {
    super.initState();
    futuro_cardapios = servico.pegarCardapios(widget.id_loja);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('Cardapio')),
    body: FutureBuilder<List<Cardapio>>(
      future: futuro_cardapios,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('nenhum item no cardapio'));
        }

        var itens = snapshot.data!;

        return ListView.builder(
        itemCount: itens.length,
        itemBuilder: (context, indice) {
          var item = itens[indice];
          return ListTile(
          title: Text(item.nome_produto),
          subtitle: Text(item.descricao),
          trailing: Text('R\$ ' + item.preco.toString()),
          );
        },
        );
      },
    ),
    );
  }
}
