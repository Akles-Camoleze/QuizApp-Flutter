// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  final _perguntas = const [
      {
        'texto': 'Qual é a sua cor favorita?',
        'resposta': ['Preto', 'Vermelho', 'Rosa', 'Roxo'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'resposta': ['Cachorro', 'Gato', 'Rato', 'Hamster'],
      },
      {
        'texto': 'Qual a sua categoria?',
        'resposta': ['Chupetinha','Mirim', 'Infantil', 'Juvenil'],
      }

    ];

  void responder(){
    if(askSelected){
      setState(() {
        perguntaSelecionada++;
      });
    }
  }

  bool get askSelected{
    return perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context){

    List<String> resposta = askSelected
    ? _perguntas[perguntaSelecionada].cast()['resposta']
    : [];

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple[800],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
          backgroundColor: Colors.deepPurple[800],
        ),
        body: askSelected ? Column(
          children: [
            Questao(_perguntas[perguntaSelecionada]['texto'].toString()),
            ...resposta.map((texto) => Resposta(texto, responder)).toList(),
          ],
        )
        : const Center(
          child: Text(
            'Parabéns!',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }

}

class PerguntaApp extends StatefulWidget{
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
  
}