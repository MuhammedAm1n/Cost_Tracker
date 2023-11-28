import 'package:WeeklyExpenses/DomainLayer/Enitities/TrackItem.dart';
import 'package:WeeklyExpenses/DomainLayer/Use_Cases/usecases.dart';
import 'package:WeeklyExpenses/PresentationLayer/Components/ITemzSummary.dart';
import 'package:WeeklyExpenses/PresentationLayer/Components/ITemzTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController newIteamNameController = TextEditingController();
  final TextEditingController newIteamAmountController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
// preapare to display

    Provider.of<UseCase>(context, listen: false).PreparDataHiveUseCase();
  }

  //add new iteam
  void addnewITem() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Add mew ITEM'),
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                // Iteam Name
                TextField(
                  controller: newIteamNameController,
                  decoration: InputDecoration(
                      hintText: 'Item Name',
                      suffixIcon: Icon(Icons.text_fields)),
                ),

                // Iteam Amount
                TextField(
                  controller: newIteamAmountController,
                  decoration: InputDecoration(
                      hintText: 'Price',
                      suffixIcon: Icon(Icons.price_change_rounded)),
                  keyboardType: TextInputType.number,
                ),
              ]),
              actions: [
                MaterialButton(
                  onPressed: save,
                  child: Text('Save'),
                ),
                MaterialButton(
                  onPressed: cancel,
                  child: Text('Cancel'),
                )
              ],
            ));
  }

// delet item
  void deletItem(Trackitem itmz) {
    Provider.of<UseCase>(context, listen: false).UsedeletITEM(itmz);
  }

  // save

  void save() {
    if (newIteamNameController.text.isNotEmpty &&
        newIteamAmountController.text.isNotEmpty) {
      Trackitem itmz = Trackitem(
          amount: newIteamAmountController.text,
          date: DateTime.now(),
          name: newIteamNameController.text);
      Provider.of<UseCase>(context, listen: false).UseaddNEWITEM(itmz);
      Navigator.pop(context);
      clear();
    }
  }

// cancel
  void cancel() {
    Navigator.pop(context);
    clear();
  }

  // clear Controllers
  void clear() {
    newIteamAmountController.clear();
    newIteamNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UseCase>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: addnewITem,
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 18, 67, 107),
        ),
        body: ListView(children: [
          // weekly summary
          SizedBox(height: 20),
          ITemzSummary(startofweek: value.UsestartOFWEEKDATE()),
          // Itemz List
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: value.UsegetAllITEAMLIS().length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: ITemzTile(
                name: value.UsegetAllITEAMLIS()[index].name,
                amount: value.UsegetAllITEAMLIS()[index].amount,
                dateTime: value.UsegetAllITEAMLIS()[index].date,
                deletTap: (p0) => deletItem(value.UsegetAllITEAMLIS()[index]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
