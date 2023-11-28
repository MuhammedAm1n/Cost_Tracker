// ignore_for_file: prefer_const_constructors

import 'package:WeeklyExpenses/PresentationLayer/Bargraph/BarDataMod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBargraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;
  const MyBargraph({
    super.key,
    required this.maxY,
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  });

  @override
  Widget build(BuildContext context) {
    //intilze BarData
    BarData myBarData = BarData(
        sunAmount: sunAmount,
        monAmount: monAmount,
        tueAmount: tueAmount,
        wedAmount: wedAmount,
        thurAmount: thurAmount,
        friAmount: friAmount,
        satAmount: satAmount);

    myBarData.initializeBarData();

    return BarChart(BarChartData(
      maxY: maxY,
      minY: 0,
      // Playing with Background of graph
      titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getBottomTitle,
          ))),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      barGroups: myBarData.barData
          .map((data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: Color.fromARGB(255, 18, 67, 107),
                      width: 25,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                          color: Colors.grey[300], show: true, toY: maxY)),
                ],
              ))
          .toList(),
    ));
  }
}

Widget getBottomTitle(double value, TitleMeta meta) {
  const style = TextStyle(
      color: Color.fromARGB(255, 18, 67, 107),
      fontWeight: FontWeight.bold,
      fontSize: 14);
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text(
        'Sun',
        style: style,
      );
      break;
    case 1:
      text = Text(
        'Mon',
        style: style,
      );
      break;

    case 2:
      text = Text(
        'Tue',
        style: style,
      );
      break;

    case 3:
      text = Text(
        'Wed',
        style: style,
      );
      break;

    case 4:
      text = Text(
        'Thu',
        style: style,
      );
      break;

    case 5:
      text = Text(
        'Fri',
        style: style,
      );
      break;

    case 6:
      text = Text(
        'Sat',
        style: style,
      );
      break;

    default:
      text = const Text(
        ' ',
        style: style,
      );
      break;
  }

  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
