import 'package:WeeklyExpenses/DomainLayer/Enitities/TrackItem.dart';

abstract class AbsRepositry {
  List<Trackitem> getAllITEAMLIS();
  void addNEWITEM(Trackitem itmz);
  void deletITEM(Trackitem itmz);
  String getNAMEDAY(DateTime dateTime);
  DateTime startOFWEEKDATE();
  Map<String, double> calculateDAILYSUMMARY();
  void preparedataHive();
}
