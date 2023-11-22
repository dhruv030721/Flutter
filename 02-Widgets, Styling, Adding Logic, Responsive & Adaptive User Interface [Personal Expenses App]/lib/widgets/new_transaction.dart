import 'package:flutter/material.dart';
import '../main.dart';
import 'package:intl/intl.dart';

class NewTransction extends StatefulWidget {
  final Function addTx;

  NewTransction(this.addTx);

  @override
  State<NewTransction> createState() => _NewTransctionState();
}

class _NewTransctionState extends State<NewTransction> {
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  bool _isDateChosen = false;
  DateTime? _selectedDate;

  void submitData() {
    if (_amountcontroller.text.isEmpty) {
      return;
    }
    final enteredTitle = _titlecontroller.text;
    final enteredAmount = double.parse(_amountcontroller.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    //it is used to pop top most screen that is displayed
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: _selectedDate ?? DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        _isDateChosen = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titlecontroller,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            SizedBox(
              width: double.infinity,
              height: 15,
            ),
            Container(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _isDateChosen
                          ? DateFormat().add_yMMMEd().format(_selectedDate!)
                          : 'No date chosen',
                    ),
                  ),
                  TextButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose Date',
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: submitData,
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(MyApp.darkblue)),
                child: Text(
                  "Add Transcation",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
