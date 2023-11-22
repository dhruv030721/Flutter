import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expanses_app/widgets/chart_bar.dart';
import '../models/transcationModel.dart';

class Chart extends StatelessWidget {
  final List<Transcation> recentTransctions;

  const Chart(this.recentTransctions);

  List<Map<String, Object>> get groupedTransctionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < recentTransctions.length; i++) {
        if (recentTransctions[i].date.day == weekDay.day &&
            recentTransctions[i].date.month == weekDay.month &&
            recentTransctions[i].date.year == weekDay.year) {
          totalSum += recentTransctions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalspending {
    return groupedTransctionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransctionValues);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransctionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'].toString(),
                    data['amount'] as double,
                    totalspending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalspending),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
