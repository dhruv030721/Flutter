import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

typedef Answerquestioncallback = void Function(int score);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'question': 'What is your favourite color?',
      'answer': [
        {'text': 'Red', 'score': 5},
        {'text': 'Black', 'score': 10},
        {'text': 'Pink', 'score': 15},
        {'text': 'Blue', 'score': 8}
      ],
    },
    {
      'question': 'What is your favourite bird?',
      'answer': [
        {'text': 'Peacock', 'score': 15},
        {'text': 'Piegon', 'score': 10},
        {'text': 'Dove', 'score': 12},
        {'text': 'Parrot', 'score': 8},
      ],
    },
    {
      'question': 'What is the name of your favourite car brand',
      'answer': [
        {'text': 'BMW', 'score': 12},
        {'text': 'Lemborghini', 'score': 20},
        {'text': 'Ferrari', 'score': 15},
        {'text': 'Lexus', 'score': 18}
      ],
    },
  ];
  var _questionsIndex = 0;
  var _totalScore = 0;

  void resetquiz() {
    setState(() {
      _questionsIndex = 0;
      _totalScore = 0;
    });
  }

  void answerquestion(int score) {
    _totalScore += score;
    setState(() {
      _questionsIndex = _questionsIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Quiz App"),
        ),
        body: _questionsIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionsIndex: _questionsIndex,
                answerquestion: answerquestion)
            : Result(_totalScore, resetquiz),
      ),
    );
  }
}
