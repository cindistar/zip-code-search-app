import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viacep_app/repositories/cep_repository.dart';
import 'package:viacep_app/resources/enum_states_status.dart';
import 'package:viacep_app/resources/strings.dart';

import '../../models/cep_model.dart';

part 'cep_event.dart';
part 'cep_state.dart';

class CepBloc extends Bloc<CepEvent, CepState> {
  final CepRepository _cepRepository;
  CepBloc(this._cepRepository)
      : super(CepState(
            ceps: Cep(
              logradouro: '',
              bairro: '',
              ddd: '',
              localidade: '',
              uf: '',
            ),
            status: CepStatus.initial)) {
    on<CepLoaded>(_onCepLoaded);
  }

  void _onCepLoaded(CepLoaded event, Emitter<CepState> emit) async {
    emit(state.copyWith(status: CepStatus.loading));

    try {
      final getCep = await _cepRepository.getCep(event.cep);
      emit(state.copyWith(status: CepStatus.success, ceps: getCep));
    } catch (e) {
      emit(state.copyWith(
        status: CepStatus.failure,
        errorMessage: Strings.errorMessage,
      ));
    }
  }
}
