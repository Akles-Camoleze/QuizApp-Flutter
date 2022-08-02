// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  var pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 20},
        {'texto': 'Vermelho', 'pontuacao': 15},
        {'texto': 'Rosa', 'pontuacao': 10},
        {'texto': 'Roxo', 'pontuacao': 5},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto': 'Cachorro', 'pontuacao': 20},
        {'texto': 'Gato', 'pontuacao': 15},
        {'texto': 'Rato', 'pontuacao': 10},
        {'texto': 'Hamster', 'pontuacao': 5},
      ],
    },
    {
      'texto': 'Qual a sua categoria?',
      'resposta': [
        {'texto': 'Chupetinha', 'pontuacao': 20},
        {'texto': 'Mirim', 'pontuacao': 15},
        {'texto': 'Infantil', 'pontuacao': 10},
        {'texto': 'Juvenil', 'pontuacao': 5},
      ],
    }
  ];

  bool get askSelected {
    return perguntaSelecionada < _perguntas.length;
  }

  void responder(int pontuacao) {
    if (askSelected) {
      setState(() {
        perguntaSelecionada++;
        pontuacaoTotal+= pontuacao;
      });
    }
  }

  void reloadQuiz() {
    setState(() {
      perguntaSelecionada = 0;
      pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple[800],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
          backgroundColor: Colors.deepPurple[800],
        ),
        body: askSelected
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: perguntaSelecionada,
                quandoResponder: responder,
              )
            : Resultado(pontuacaoTotal, reloadQuiz),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
