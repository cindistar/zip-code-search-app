import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:viacep_app/blocs/bloc/cep_bloc.dart';
import 'package:viacep_app/clients/cep_api_client.dart';
import 'package:viacep_app/repositories/cep_repository.dart';

setUpInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerFactory(() => CepBloc(getIt()));
  getIt.registerFactory(() => Dio());
  getIt.registerLazySingleton(() => CepApiClient(getIt()));
  getIt.registerLazySingleton(() => CepRepository(getIt()));
}
