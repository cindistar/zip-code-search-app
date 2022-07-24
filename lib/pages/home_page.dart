import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:viacep_app/blocs/bloc/cep_bloc.dart';
import 'package:viacep_app/repositories/cep_repository.dart';
import 'package:viacep_app/resources/enum_states_status.dart';
import 'package:viacep_app/resources/strings.dart';
import 'package:viacep_app/widgets/cep_card_widget.dart';
import 'package:viacep_app/widgets/cep_textfield_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final cepRepository = GetIt.I.get<CepRepository>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          Strings.appBarTitle,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => CepBloc(cepRepository),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const CepTextFieldWidget(),
              BlocBuilder<CepBloc, CepState>(
                builder: (context, state) {
                  final cep = state.ceps;
                  switch (state.status) {
                    case CepStatus.initial:
                      return Container();
                    case CepStatus.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case CepStatus.success:
                      return CepCardWidget(
                        logradouro: cep.logradouro,
                        bairro: cep.bairro,
                        localidade: cep.localidade,
                        uf: cep.uf,
                        ddd: cep.ddd,
                      );
                    case CepStatus.failure:
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.red[50],
                            border: Border.all(
                              color: Colors.red,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          Strings.errorMessage,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
