import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback stateHandler;
  final String answer;

  Answer(this.stateHandler, this.answer);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: stateHandler, child: Text(answer)),
    );
  }
}
