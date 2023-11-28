import 'package:WeeklyExpenses/DomainLayer/Abs_Repositry/absrepositry.dart';
import 'package:flutter/material.dart';

import '../Enitities/TrackItem.dart';

class UseCase extends ChangeNotifier {
  final AbsRepositry absRepositry;

  UseCase(this.absRepositry);

  void UseaddNEWITEM(Trackitem itmz) {
    absRepositry.addNEWITEM(itmz);
    notifyListeners();
  }

  void UsedeletITEM(Trackitem itmz) {
    absRepositry.deletITEM(itmz);
    notifyListeners();
  }

  String UsegetNAMEDAY(DateTime dateTime) {
    return absRepositry.getNAMEDAY(dateTime);
  }

  DateTime UsestartOFWEEKDATE() {
    return absRepositry.startOFWEEKDATE();
  }

  Map<String, double> UsecalculateDAILYSUMMARY() {
    return absRepositry.calculateDAILYSUMMARY();
  }

  List<Trackitem> UsegetAllITEAMLIS() {
    return absRepositry.getAllITEAMLIS();
  }

  void PreparDataHiveUseCase() {
    absRepositry.preparedataHive();
  }
}
