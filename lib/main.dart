import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 50},
        {'text': 'Red', 'score': 40},
        {'text': 'Green', 'score': 100},
        {'text': 'White', 'score': 0},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 100},
        {'text': 'Dog', 'score': 0},
        {'text': 'Fox', 'score': 100},
        {'text': 'Bear', 'score': 100},
      ]
    },
    {
      'questionText': 'Which day is boneless thursday?',
      'answers': [
        {'text': 'Monday', 'score': 0},
        {'text': 'Tuesday', 'score': 0},
        {'text': 'Wednesday', 'score': 0},
        {'text': 'Thursday', 'score': 100},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print('answer chosen');
  }

  void _reset() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My First App'),
            ),
            body: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questions: _questions,
                    questionIndex: _questionIndex,
                  )
                : Result(_totalScore, _reset)
            // Text('This is my default text!'),
            ));
  }
}
