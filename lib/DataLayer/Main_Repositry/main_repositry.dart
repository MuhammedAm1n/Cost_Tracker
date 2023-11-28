import 'package:WeeklyExpenses/DataLayer/Data_Source/drc.dart';
import 'package:WeeklyExpenses/DataLayer/Models/TrackitemModel.dart';
import 'package:WeeklyExpenses/DomainLayer/Abs_Repositry/absrepositry.dart';
import 'package:WeeklyExpenses/DomainLayer/Enitities/TrackItem.dart';

class MainRepositry implements AbsRepositry {
  final AbsDataSource absDataSource;

  MainRepositry(this.absDataSource);

  @override
  void addNEWITEM(Trackitem itmz) {
    final TrackitemModel model =
        TrackitemModel(amount: itmz.amount, date: itmz.date, name: itmz.name);
    absDataSource.addNEWITEM(model);
  }

  @override
  void deletITEM(Trackitem itmz) {
    final TrackitemModel model =
        TrackitemModel(amount: itmz.amount, date: itmz.date, name: itmz.name);
    absDataSource.deletITEM(model);
  }

  @override
  Map<String, double> calculateDAILYSUMMARY() {
    return absDataSource.calculateDAILYSUMMARY();
  }

  @override
  List<Trackitem> getAllITEAMLIS() {
    return absDataSource.getAllITEAMLIS();
  }

  @override
  String getNAMEDAY(DateTime date) {
    return absDataSource.getNAMEDAY(date);
  }

  @override
  DateTime startOFWEEKDATE() {
    return absDataSource.startOFWEEKDATE();
  }

  @override
  void preparedataHive() {
    absDataSource.preparedata();
  }
}
