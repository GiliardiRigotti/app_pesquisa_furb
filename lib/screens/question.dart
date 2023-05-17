// ignore_for_file: avoid_print

import 'package:app_pesquisa_furb/main.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

void _submit() {
  navigatorKey.currentState!.pushNamed("/question");
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pergunta'),
        centerTitle: true,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("Você faz exercicio?"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: _submit,
                child: Text("Sim"),
              ),
              ElevatedButton(
                onPressed: _submit,
                child: Text("Não"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
