

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:flutter_complete_guide/widgets/chartBar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> _recentTransactions;
  Chart(this._recentTransactions);

 List<Map<String,Object>> get groupedTransactionValues{
   return List.generate(7, (index){
     final DateTime weekday= DateTime.now().subtract(Duration(days: index));
     double totalSum=0.0;
     for(int i=0;i<_recentTransactions.length;i++){
       if(_recentTransactions[i].date.day==weekday.day && _recentTransactions[i].date.month==weekday.month
       && _recentTransactions[i].date.year==weekday.year)
         totalSum+=_recentTransactions[i].amount;
     }
     return {
       'day':DateFormat('E').format(weekday),
       'amount':totalSum
     };
   }).reversed.toList();
 }

  @override
  Widget build(BuildContext context) {
   print(groupedTransactionValues);
    return Card(
      elevation: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: groupedTransactionValues.map((data){
          return ChartBar(data['day'],data['amount'],maxSpending==0.0?0.00:((data['amount']as double)/maxSpending));
        }).toList(),
      ),
    );
  }

  double get maxSpending {
   return groupedTransactionValues.fold(0.0,(sum,item){
     return sum+ item['amount'];
   });
  }
}

