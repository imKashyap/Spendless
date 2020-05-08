
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';
class TransactionTile extends StatefulWidget {

  const TransactionTile({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  _TransactionTileState createState() => _TransactionTileState();
}

class _TransactionTileState extends State<TransactionTile> {
  Color _bgColor;
  @override
  void initState() {
    final List<Color> colors=[
      Colors.red,
      Colors.blue,
      Colors.grey,
      Colors.black,
      Colors.green,
      Colors.yellow,
    ];
    _bgColor=colors[Random().nextInt(colors.length)];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          key: widget.key,
          radius: 30,
          backgroundColor: _bgColor,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('₹${widget.transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
          icon: const Icon(Icons.delete),
          label: const Text('Delete'),
          textColor: Theme.of(context).errorColor,
          onPressed: () => widget.deleteTx(widget.transaction.id),
        )
            : IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => widget.deleteTx(widget.transaction.id),
        ),
      ),
    );
  }
}
