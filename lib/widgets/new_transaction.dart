import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final Function onAdd;

  NewTransaction(this.onAdd);

  void addTransaction() {
    double txAmount = double.parse(amountController.text);
    String txTitle = titleController.text;

    if(txTitle.isEmpty || txAmount <= 0) return;

    this.onAdd(txTitle, txAmount);
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
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
