import 'package:my_isekai/models/personagem_equipamento.dart';
import 'package:my_isekai/models/personagem_atributos.dart';

class UserPersonagem {
  String id;
  String token;
  String user_nome;
  String user_foto;
  String user_date;
  String user_descricao;
  String user_titulo;
  String user_raca;
  String user_profissao;
  String user_idade;
  String user_pontoforte;
  String user_pontofraco;
  int user_level;
  int user_distance;
  String createdAt;
  PersonagemAtributos personagemAtributos;
  PersonagemEquipamento personagemEquipamento;

  UserPersonagem({
    this.id = '1cutfEZ41pQIA98FjGXZSi9Smj23',
    this.token = 'token123',
    this.user_nome = 'Lucas',
    this.user_foto = '',
    this.user_date = '1641673655707',
    this.user_descricao = '',
    this.user_titulo = 'Mago',
    this.user_raca = '',
    this.user_profissao = '',
    this.user_idade = '1222',
    this.user_pontoforte = '',
    this.user_pontofraco = '',
    this.user_level = 1,
    this.user_distance = 20,
    this.createdAt = '1641673685961',
    this.personagemAtributos,
    this.personagemEquipamento,
  });
}
