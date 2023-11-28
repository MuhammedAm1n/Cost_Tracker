import 'package:WeeklyExpenses/DataLayer/Data_Source/hivedatabase.dart';
import 'package:WeeklyExpenses/DataLayer/Models/TrackitemModel.dart';
import 'package:WeeklyExpenses/Utilites/datetimehelper.dart';

abstract class AbsDataSource {
  List<TrackitemModel> getAllITEAMLIS();
  void addNEWITEM(TrackitemModel itemz);
  void deletITEM(TrackitemModel itemz);
  String getNAMEDAY(DateTime dateTime);
  DateTime startOFWEEKDATE();
  Map<String, double> calculateDAILYSUMMARY();
  void preparedata();
}

class DataSource implements AbsDataSource {
  List<TrackitemModel> overallItemList = [];

  // get All iTems from list
  @override
  List<TrackitemModel> getAllITEAMLIS() {
    return overallItemList;
  }

  // preapare data
  final db = Hivedatabase();

  @override
  void preparedata() {
    if (db.readData().isNotEmpty) {
      overallItemList = db.readData();
    }
  }

// add item
  @override
  void addNEWITEM(TrackitemModel newItem) {
    overallItemList.add(newItem);
    db.SaveData(overallItemList);
  }

  //delet item
  @override
  void deletITEM(TrackitemModel removeIteam) {
    overallItemList.remove(removeIteam);
    db.SaveData(overallItemList);
  }

// get weekday ( mon , tue ,etc ) from a dateTime obj
  @override
  String getNAMEDAY(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';

      default:
        return ' ';
    }
  }

// get the date of the start of the week ( sunday )
  @override
  DateTime startOFWEEKDATE() {
    DateTime? startOfweek;
// get today's date
    DateTime today = DateTime.now();
// go backwards from today to find sunday
    for (int i = 0; i < 7; i++) {
      if (getNAMEDAY(today.subtract(Duration(days: i))) == 'Sun') {
        startOfweek = today.subtract(Duration(days: i));
      }
    }
    return startOfweek!;
  }

  @override
  Map<String, double> calculateDAILYSUMMARY() {
    Map<String, double> dailySummary = {
      // date (yyyymmdd) : amountTotalforDay
    };

    for (var item in overallItemList) {
      // iteam 1
      String date = ConvertDateTimeToString(item.date); // iteam 1 date = 13
      double amount = double.parse(item.amount); // iteam 1 amount = 50 dollars

      if (dailySummary.containsKey(date)) {
        // if iteam 1 mawgood return true
        double currentAmount =
            dailySummary[date]!; // currentamount =  50 Dollars
        currentAmount += amount; // currentamount = 50 + 20  = 70 Dollars
        dailySummary[date] = currentAmount; // dailySummary 13 = 70
      } else {
        dailySummary.addAll({date: amount});
      }
    }
    return dailySummary;
  }
}
