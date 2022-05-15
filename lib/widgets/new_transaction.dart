import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // String titleInput;
  // String amountInput;
  final Function addTransaction;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  NewTransaction(this.addTransaction);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (value) {
              //   this.titleInput = value;
              // }
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (value) {
              //   this.amountInput = value;
              // },
            ),
            FlatButton(
              onPressed: () {
                addTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
