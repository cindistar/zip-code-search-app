import 'dart:convert';

Cep cepFromMap(String str) => Cep.fromMap(json.decode(str));

String cepToMap(Cep data) => json.encode(data.toMap());

class Cep {
  Cep({
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
    this.complemento,
    this.ibge,
    this.gia,
    this.siafi,
    this.cep,
  });
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;
  final String ddd;
  final String? complemento;
  final String? ibge;
  final String? gia;
  final String? siafi;
  final String? cep;

  factory Cep.fromMap(Map<String, dynamic> json) => Cep(
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
        ibge: json["ibge"],
        gia: json["gia"],
        ddd: json["ddd"],
        siafi: json["siafi"],
      );

  Map<String, dynamic> toMap() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
        "ibge": ibge,
        "gia": gia,
        "ddd": ddd,
        "siafi": siafi,
      };
}
