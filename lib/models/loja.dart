class Loja {
  int id_loja;
  String nome_loja;
  String endereco;
  String foto;

  Loja(this.id_loja, this.nome_loja, this.endereco, this.foto);

  factory Loja.fromJson(Map<String, dynamic> json) {
    return Loja(
    json['id_loja'],
    json['nome_loja'],
    json['endereco'],
    json['foto'],
    );
  }
}
