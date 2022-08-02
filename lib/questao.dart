import 'package:flutter/material.dart';

class Questao extends StatelessWidget {

  final String texto;

  const Questao(this.texto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(15),
      child: Text(
          texto,
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
    );
  }
}