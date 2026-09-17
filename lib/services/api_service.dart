import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/loja.dart';
import '../models/cardapio.dart';

class ApiService {
  String url_base = 'http://10.0.2.2:3000/api';

  Future<List<Loja>> pegarLojas() async {
    var lista_lojas = <Loja>[];
    var resposta = await http.get(Uri.parse(url_base + '/lojas'));

    if (resposta.statusCode == 200) {
      var json_resposta = jsonDecode(resposta.body);

      if (json_resposta['success'] == true) {
        var dados = json_resposta['data'];
        for (var item in dados) {
          lista_lojas.add(Loja.fromJson(item));
        }
      }
    }

    return lista_lojas;
  }

  Future<List<Cardapio>> pegarCardapios(int id_loja) async {
    var lista_cardapios = <Cardapio>[];
    var resposta = await http.get(Uri.parse(url_base + '/lojas/' + id_loja.toString() + '/cardapios'));

    if (resposta.statusCode == 200) {
      var json_resposta = jsonDecode(resposta.body);

      if (json_resposta['success'] == true) {
        var dados = json_resposta['data'];
        for (var item in dados) {
          lista_cardapios.add(Cardapio.fromJson(item));
        }
      }
    }

    return lista_cardapios;
  }
}
