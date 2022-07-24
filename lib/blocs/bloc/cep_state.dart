part of 'cep_bloc.dart';

class CepState {
  final CepStatus status;
  final Cep ceps;
  final String? errorMessage;

  CepState({
    required this.status,
    required this.ceps,
    this.errorMessage,
  });

  CepState copyWith({
    CepStatus? status,
    Cep? ceps,
    String? errorMessage,
  }) {
    return CepState(
      status: status ?? this.status,
      ceps: ceps ?? this.ceps,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
