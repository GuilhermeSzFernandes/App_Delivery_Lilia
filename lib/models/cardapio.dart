class Cardapio {
  int id_cardapio;
  String nome_produto;
  String descricao;
  double preco;
  String foto;

  Cardapio(this.id_cardapio, this.nome_produto, this.descricao, this.preco, this.foto);

  factory Cardapio.fromJson(Map<String, dynamic> json) {
    return Cardapio(
    json['id_cardapio'],
    json['nome_produto'],
    json['descricao'],
    json['preco'] * 1.0,
    json['foto'],
    );
  }
}
