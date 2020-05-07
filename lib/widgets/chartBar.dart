import 'package:flutter/material.dart';
class ChartBar extends StatelessWidget {
  final String weekDay;
  final double amount;
  final double percentSpent;
  ChartBar(
      this.weekDay,
      this.amount,
      this.percentSpent
      );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(weekDay),
        SizedBox(
          height: 4.0,
        ),
        Container(
          height: 60.0,
          width: 10.0,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentSpent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(5.0),
                  ),

                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text('₹'+amount.toStringAsFixed(2)),
      ],
    );
  }
}
