import "package:flutter/material.dart";
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:flutter_complete_guide/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  // List<Map<String, Object>> get groupTransactionValues {
  //   final dateFormat =
  //       (DateTime date) => '${date.year}${date.month}${date.day}';

  //   final groupByDay = recentTransactions.fold(
  //     {},
  //     (prev, transaction) {
  //       var date = dateFormat(transaction.date);
  //       if (!prev.containsKey(date)) {
  //         prev[date].add(transaction);
  //       }
  //     },
  //   );

  //   return List.generate(
  //     7,
  //     (index) {
  //       final today = DateTime.now().subtract(
  //         Duration(days: index),
  //       );
  //       var totalSum = 0.0;

  //       for (var i = 0; i < recentTransactions.length; i++) {}
  //       return {
  //         'day': DateFormat.E(today),
  //         'amount': groupByDay[dateFormat(today)]
  //             .fold(0, (prev, transaction) => prev + transaction.amount),
  //       };
  //     },
  //   );
  // }

  double get totalSpending {
    return groupedAmountLastWeek.fold(
      0.0,
      (prev, curr) => prev += curr['amount'],
    );
  }

  List<Map> get groupedAmountLastWeek {
    List<double> lastWeekAmounts = this.lastWeekAmounts();

    return List.generate(7, (index) {
      return {
        'day': DateFormat.E()
            .format(
              // convert from exact string format
              // e.g. 2022-05-18 16:53:59.205706 to a day
              DateTime.now().subtract(
                Duration(days: index),
              ),
            )
            .substring(0, 1),
        'amount': lastWeekAmounts[index],
      };
    });
  }

  List<double> lastWeekAmounts() {
    final DateTime now = DateTime.now();
    List<double> result = [0, 0, 0, 0, 0, 0, 0];

    for (int i = 0; i < recentTransactions.length; i++) {
      int daysAgo = now.difference(recentTransactions[i].date).inDays;
      result[daysAgo] += recentTransactions[i].amount;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedAmountLastWeek.map((data) {
            return Flexible(
              // flex: 1,
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'],
                data['amount'],
                totalSpending == 0.0 ? 0.0 : data['amount'] / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
