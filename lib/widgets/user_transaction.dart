import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
      id: "1",
      title: "New shoes",
      amount: 69,
      date: DateTime.now(),
    ),
    Transaction(
      id: "2",
      title: "Valorant knife",
      amount: 10,
      date: DateTime.now(),
    ),
    Transaction(
      id: "3",
      title: "Badminton string",
      amount: 19,
      date: DateTime.now(),
    ),
    Transaction(
      id: "4",
      title: "Badminton shuttle",
      amount: 40,
      date: DateTime.now(),
    ),
    Transaction(
      id: "5",
      title: "Badminton court",
      amount: 15,
      date: DateTime.now(),
    ),
    Transaction(
      id: "6",
      title: "Cruise",
      amount: 500,
      date: DateTime.now(),
    ),
    Transaction(
      id: "7",
      title: "UST",
      amount: 2000,
      date: DateTime.now(),
    ),
    Transaction(
      id: "8",
      title: "Etoro",
      amount: 15000,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = new Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
