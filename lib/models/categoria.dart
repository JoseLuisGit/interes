import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intereses/models/url.dart';

Categoria categoriaFromJson(String str) => Categoria.fromJson(json.decode(str));

String categoriaToJson(Categoria data) => json.encode(data.toJson());

class Categoria {
  int id;
  String nombre;

  Categoria({this.id, this.nombre});

  Map<String, dynamic> toJson() {
    return {'id': id, 'nombre': nombre};
  }

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return new Categoria(id: json['id'], nombre: json['nombre']);
  }
}

List<Categoria> parseCategoria(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Categoria>((json) => Categoria.fromJson(json)).toList();
}

Future<List<Categoria>> getCategorias() async {
  final response = await http.Client().get(URL_interes);
  if (response.statusCode == 200) {
    print(response.body);
    return parseCategoria(response.body);
  } else {
    throw Exception('No hay Internet');
  }
}
