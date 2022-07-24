part of 'cep_bloc.dart';

abstract class CepEvent {}

class CepLoaded extends CepEvent {
  final String cep;

  CepLoaded({required this.cep});
}
