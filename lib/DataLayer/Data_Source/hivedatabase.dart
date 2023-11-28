import 'package:WeeklyExpenses/DataLayer/Models/TrackitemModel.dart';
import 'package:hive/hive.dart';

class Hivedatabase {
// reference our box

  final _mybox = Hive.box('items_database');

  // write data
  void SaveData(List<TrackitemModel> Allitems) {
    List<List<dynamic>> allItemsformatted = [];
    for (var item in Allitems) {
      //convert each trackitem into list
      List<dynamic> itemformatted = [item.name, item.amount, item.date];
      allItemsformatted.add(itemformatted);
    }
    _mybox.put('ALL_ITEMS', allItemsformatted);
  }

  // read data

  List<TrackitemModel> readData() {
    List saveitem = _mybox.get('ALL_ITEMS') ?? [];
    List<TrackitemModel> allitems = [];

    for (int i = 0; i < saveitem.length; i++) {
      String name = saveitem[i][0];
      String amount = saveitem[i][1];
      DateTime date = saveitem[i][2];
      // create item
      TrackitemModel item =
          TrackitemModel(amount: amount, date: date, name: name);
      //
      allitems.add(item);
    }
    return allitems;
  }
}
