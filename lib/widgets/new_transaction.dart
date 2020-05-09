import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final Function onAdd;

  NewTransaction(this.onAdd); 

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
                      // onChanged: (val) => titleInput = val,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                      // onChanged: (val) => amountInput = val,
                    ),
                    FlatButton(
                      child: Text('Add Transaction'),
                      onPressed: () { 
                        double txAmount = double.parse(amountController.text);
                        String txTitle = titleController.text;

                        this.onAdd(txTitle, txAmount);
                      },
                      textColor: Colors.purple,
                    )
                  ],
                ),
              ),
            );
  }
}