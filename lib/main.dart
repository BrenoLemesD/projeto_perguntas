import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto':
          'Responda o questionario a seguir para ver se você conhece o Breno',
      'respostas': [
        {'texto': 'Claro', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual é a cor favorita do Breno?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 0},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 0},
        {'texto': 'Branco', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é o animal de estimação favorito dele?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 0},
        {'texto': 'Gato', 'pontuacao': 5},
        {'texto': 'Cobra', 'pontuacao': 0},
        {'texto': 'Leão', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'E o esporte você sabe?',
      'respostas': [
        {'texto': 'Basquete', 'pontuacao': 5},
        {'texto': 'Futebol', 'pontuacao': 0},
        {'texto': 'Vôlei', 'pontuacao': 0},
        {'texto': 'Natação', 'pontuacao': 0},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarTudo() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarTudo),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
