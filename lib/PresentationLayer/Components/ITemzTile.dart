import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ITemzTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  void Function(BuildContext)? deletTap;
  ITemzTile(
      {super.key,
      required this.name,
      required this.amount,
      required this.dateTime,
      required this.deletTap});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deletTap,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
      child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: Color.fromARGB(255, 18, 67, 107),
          title: Text(
            name,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
              '${dateTime.day.toString()} / ${dateTime.month.toString()} / ${dateTime.year.toString()}',
              style: TextStyle(color: Colors.white)),
          trailing: Text(
            amount + ' Egp',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )),
    );
  }
}
