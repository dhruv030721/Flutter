import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final VoidCallback reset;
  Result(this.resultscore, this.reset);

  String get resultPharse {
    var resultText = 'Your score is $resultscore';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPharse,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(onPressed: reset, child: Text('Reset Quiz')),
        ],
      ),
    );
  }
}
