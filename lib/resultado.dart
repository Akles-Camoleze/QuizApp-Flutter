import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reloadQuiz;

  const Resultado(this.pontuacao, this.reloadQuiz, {Key? key})
      : super(key: key);

  String get fraseResultado {
    if (pontuacao <= 15) {
      return 'Parabéns!';
    } else {
      if (pontuacao <= 20) {
        return 'Você é bom!';
      } else {
        if (pontuacao <= 25) {
          return 'Impressionante!';
        } else {
          return 'Nível Jedi!';
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 24,
              fontFamily: 'Ubuntu',
            ),
          ),
        ),
        TextButton(
          onPressed: reloadQuiz,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 68, 40, 151),
            ),
          ),
        ),
      ],
    );
  }
}
