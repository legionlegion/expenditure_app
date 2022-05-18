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
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions addded yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColorLight,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            // accesses theme of textTheme => headline6 stored in ThemeData
                            // (headline 6 has been overwritten with OpenSans instead of Quicksand)
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat('yyyy/MM/dd')
                                .format(transactions[index].date),
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
