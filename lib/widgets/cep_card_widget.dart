import 'package:flutter/material.dart';
import 'package:viacep_app/resources/strings.dart';

class CepCardWidget extends StatelessWidget {
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;
  final String ddd;
  const CepCardWidget({
    Key? key,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.lime[50],
            border: Border.all(
              color: Colors.lime,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            CustomText(firstText: Strings.logradouro, secondText: logradouro),
            const SizedBox(height: 15),
            CustomText(firstText: Strings.bairro, secondText: bairro),
            const SizedBox(height: 15),
            CustomText(firstText: Strings.localidade, secondText: localidade),
            const SizedBox(height: 15),
            CustomText(firstText: Strings.uf, secondText: uf),
            const SizedBox(height: 15),
            CustomText(firstText: Strings.ddd, secondText: ddd),
          ],
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
            text: '$firstText: ',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(text: secondText, style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.2)),
            ]),
      ),
    );
  }
}
