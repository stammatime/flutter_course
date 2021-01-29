import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 100) {
      resultText = 'You\'ve made some mistakes';
    } else if (resultScore <= 200) {
      resultText = 'You did ok I guess';
    } else {
      resultText = 'You are perfect and I love you';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        FlatButton(
            onPressed: () {
              resetQuiz();
            },
            child: Text('Retry'))
      ],
    ));
  }
}
