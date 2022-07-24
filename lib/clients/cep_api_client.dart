import 'package:dio/dio.dart';
import 'package:viacep_app/models/cep_model.dart';

class CepRequestFailure implements Exception {}

class CepApiClient {
  final Dio _dio;

  CepApiClient(this._dio);

  Future<Cep> getCeps({required String cep}) async {
    final fetchCep = await _dio.get('https://viacep.com.br/ws/$cep/json/');
    if (fetchCep.statusCode == 200 && fetchCep.statusCode != null) {
      final getCep = Cep.fromMap(fetchCep.data);
      return getCep;
    }
    throw CepRequestFailure();
  }
}
