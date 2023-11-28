import 'package:WeeklyExpenses/PresentationLayer/Bargraph/IndvidualbarMod.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<Indvidualbar> barData = [];

// initialize bar data

  void initializeBarData() {
    barData = [
      Indvidualbar(x: 0, y: sunAmount),
      Indvidualbar(x: 1, y: monAmount),
      Indvidualbar(x: 2, y: tueAmount),
      Indvidualbar(x: 3, y: wedAmount),
      Indvidualbar(x: 4, y: thurAmount),
      Indvidualbar(x: 5, y: friAmount),
      Indvidualbar(x: 6, y: satAmount)
    ];
  }
}
