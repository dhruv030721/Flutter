import 'package:flutter/material.dart';
import '../models/transcationModel.dart';
import 'TranscationItem.dart';

class Transction_List extends StatelessWidget {
  final List<Transcation> transctions;
  final Function deleteTransction;

  Transction_List(this.transctions, this.deleteTransction);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: EdgeInsets.only(top: 20),
        child: transctions.isEmpty
            ? Column(
                children: [
                  Text(
                    "No transctions added yet!!",
                    style: TextStyle(fontSize: 17),
                  ),
                  Container(
                    height: constraints.maxHeight * 0.5,
                    child: Image.asset(
                      'assets/images/nodata.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: transctions.length,
                itemBuilder: (context, index) {
                  return TransactionItem(
                      transction: transctions[index],
                      deleteTransction: deleteTransction);
                },
              ),
      );
    });
  }
}
