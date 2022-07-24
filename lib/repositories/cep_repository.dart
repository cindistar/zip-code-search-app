import 'package:viacep_app/clients/cep_api_client.dart';
import 'package:viacep_app/models/cep_model.dart';

class  CepRepository {
  final CepApiClient cepApiClient;

  CepRepository(this.cepApiClient);

  Future<Cep> getCep(String cep) async {
    final fetchAllCeps = await cepApiClient.getCeps(cep: cep);
    return fetchAllCeps;
  }
}
