import 'package:WeeklyExpenses/DomainLayer/Use_Cases/usecases.dart';
import 'package:WeeklyExpenses/PresentationLayer/Bargraph/Bargraph.dart';
import 'package:WeeklyExpenses/Utilites/datetimehelper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ITemzSummary extends StatelessWidget {
  final DateTime startofweek;
  const ITemzSummary({super.key, required this.startofweek});

  double calculatemaX(String sun, String mon, String tus, String wed,
      String thur, String fri, String sat, UseCase value) {
    double? max = 100;
    List<double> values = [
      value.UsecalculateDAILYSUMMARY()[sun] ?? 0,
      value.UsecalculateDAILYSUMMARY()[mon] ?? 0,
      value.UsecalculateDAILYSUMMARY()[tus] ?? 0,
      value.UsecalculateDAILYSUMMARY()[wed] ?? 0,
      value.UsecalculateDAILYSUMMARY()[thur] ?? 0,
      value.UsecalculateDAILYSUMMARY()[fri] ?? 0,
      value.UsecalculateDAILYSUMMARY()[sat] ?? 0,
    ];

    values.sort();
// get largest amont which is at the end of sorted list

    max = values.last * 1.1;
    return max == 0 ? 100 : max;
  }

// Total amount of week

  String Total(String sun, String mon, String tus, String wed, String thur,
      String fri, String sat, UseCase value) {
    List<double> values = [
      value.UsecalculateDAILYSUMMARY()[sun] ?? 0,
      value.UsecalculateDAILYSUMMARY()[mon] ?? 0,
      value.UsecalculateDAILYSUMMARY()[tus] ?? 0,
      value.UsecalculateDAILYSUMMARY()[wed] ?? 0,
      value.UsecalculateDAILYSUMMARY()[thur] ?? 0,
      value.UsecalculateDAILYSUMMARY()[fri] ?? 0,
      value.UsecalculateDAILYSUMMARY()[sat] ?? 0,
    ];
    double total = 0;
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }
    return total.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    String sunday = ConvertDateTimeToString(startofweek.add(Duration(days: 0)));
    String monday = ConvertDateTimeToString(startofweek.add(Duration(days: 1)));
    String tuseday =
        ConvertDateTimeToString(startofweek.add(Duration(days: 2)));
    String wedday = ConvertDateTimeToString(startofweek.add(Duration(days: 3)));
    String thurday =
        ConvertDateTimeToString(startofweek.add(Duration(days: 4)));
    String friday = ConvertDateTimeToString(startofweek.add(Duration(days: 5)));
    String satday = ConvertDateTimeToString(startofweek.add(Duration(days: 6)));
    return Consumer<UseCase>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  Text(
                    'Weekly Total : ',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 18, 67, 107)),
                  ),
                  Text(
                      '${Total(sunday, monday, tuseday, wedday, thurday, friday, satday, value)}' +
                          ' Egp',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 18, 67, 107))),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: MyBargraph(
              maxY: calculatemaX(sunday, monday, tuseday, wedday, thurday,
                  friday, satday, value),
              sunAmount: value.UsecalculateDAILYSUMMARY()[sunday] ?? 0,
              monAmount: value.UsecalculateDAILYSUMMARY()[monday] ?? 0,
              tueAmount: value.UsecalculateDAILYSUMMARY()[tuseday] ?? 0,
              wedAmount: value.UsecalculateDAILYSUMMARY()[wedday] ?? 0,
              thurAmount: value.UsecalculateDAILYSUMMARY()[thurday] ?? 0,
              friAmount: value.UsecalculateDAILYSUMMARY()[friday] ?? 0,
              satAmount: value.UsecalculateDAILYSUMMARY()[satday] ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
