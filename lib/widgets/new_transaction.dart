import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function onAdd;

  NewTransaction(this.onAdd);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DateTime _selectedDate;

  void addTransaction() {
    if (amountController.text.isEmpty) return;

    double txAmount = double.parse(amountController.text);
    String txTitle = titleController.text;

    if (txTitle.isEmpty || txAmount <= 0 || _selectedDate == null) return;

    widget.onAdd(txTitle, txAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return; // user pressed cancel
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => addTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => addTransaction(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date choosen!'
                          : 'Picked Date: ${DateFormat().add_yMMMd().format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _showDatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              onPressed: addTransaction,
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            )
          ],
        ),
      ),
    );
  }
}
