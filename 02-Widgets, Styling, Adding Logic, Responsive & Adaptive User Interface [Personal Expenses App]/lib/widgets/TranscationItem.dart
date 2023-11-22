import 'package:flutter/material.dart';
import '../models/transcationModel.dart';
import 'package:intl/intl.dart';
import '../main.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transction,
    required this.deleteTransction,
  });

  final Transcation transction;
  final Function deleteTransction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 5),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(
                  color: MyApp.darkblue,
                  width: 1,
                ),
                shape: BoxShape.rectangle),
            child: Text(
              '\u{20B9}${transction.amount.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          title: Text(
            transction.title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          subtitle: Text(
            DateFormat().format(transction.date),
          ),
          trailing: IconButton(
            onPressed: () => deleteTransction(transction.id),
            icon: Icon(Icons.delete),
            color: MyApp.darkblue,
          ),
        ),
      ),
    );
  }
}
