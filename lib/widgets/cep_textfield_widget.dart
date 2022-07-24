import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viacep_app/blocs/bloc/cep_bloc.dart';
import 'package:viacep_app/resources/strings.dart';

class CepTextFieldWidget extends StatefulWidget {
  const CepTextFieldWidget({Key? key}) : super(key: key);

  @override
  State<CepTextFieldWidget> createState() => _CepTextFieldWidgetState();
}

class _CepTextFieldWidgetState extends State<CepTextFieldWidget> {
  TextEditingController cepController = TextEditingController();

  @override
  void dispose() {
    cepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: TextField(
            controller: cepController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: Strings.typeZipCode,
            ),
            autofocus: true,
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () => BlocProvider.of<CepBloc>(context).add(CepLoaded(
            cep: cepController.text,
          )),
          child: const Text(
            Strings.search,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
