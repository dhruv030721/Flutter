import 'package:flutter/material.dart';
import 'package:personal_expanses_app/main.dart';

class ChartBar extends StatelessWidget {
  final String Label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar(this.Label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints) {
        return Column(
          children: [
            Container(
                height: Constraints.maxHeight * 0.15,
                child: FittedBox(
                    child:
                        Text('\u{20B9}${spendingAmount.toStringAsFixed(0)}'))),
            SizedBox(
              height: Constraints.maxHeight * 0.05,
            ),
            Container(
              height: Constraints.maxHeight * 0.6,
              width: 13,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      color: Color.fromARGB(255, 220, 220, 220),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 1.7, vertical: 1.7),
                    child: FractionallySizedBox(
                      heightFactor: spendingPctOfTotal,
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyApp.darkblue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Constraints.maxHeight * 0.05,
            ),
            FittedBox(
                child: Container(
              height: Constraints.maxHeight * 0.15,
              child: Text(Label),
            )),
          ],
        );
      },
    );
  }
}
