import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function onAdd;

  NewTransaction(this.onAdd);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  void addTransaction() {
    double txAmount = double.parse(amountController.text);
    String txTitle = titleController.text;

    if(txTitle.isEmpty || txAmount <= 0) return;

    widget.onAdd(txTitle, txAmount);

    Navigator.of(context).pop();
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
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: addTransaction,
              textColor: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
