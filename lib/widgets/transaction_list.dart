import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    '\$${transactions[index].amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat('yyyy/MM/dd').format(transactions[index].date),
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
      // * Less elegant method without ListView.builder
      // * ListView = Column + SingleChildScrollView
      // child: ListView(
      //   children: transactions.map((tx) {
      //     return Card(
      //       child: Row(
      //         children: <Widget>[
      //           Container(
      //             padding: EdgeInsets.all(10),
      //             margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      //             decoration: BoxDecoration(
      //               border: Border.all(
      //                 color: Colors.purple,
      //                 width: 2,
      //               ),
      //             ),
      //             child: Text(
      //               '\$${tx.amount}',
      //               style: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 20,
      //                 color: Colors.purple,
      //               ),
      //             ),
      //           ),
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: <Widget>[
      //               Text(
      //                 tx.title,
      //                 style: TextStyle(
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //               Text(
      //                 DateFormat('yyyy/MM/dd').format(tx.date),
      //                 style: TextStyle(
      //                   fontSize: 10,
      //                   color: Colors.grey,
      //                 ),
      //               ),
      //             ],
      //           )
      //         ],
      //       ),
      //     );
      //   }).toList(),
      // ),
    );
  }
}
