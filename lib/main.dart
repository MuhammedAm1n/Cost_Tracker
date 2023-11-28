import 'package:WeeklyExpenses/DataLayer/Data_Source/drc.dart';
import 'package:WeeklyExpenses/DataLayer/Main_Repositry/main_repositry.dart';
import 'package:WeeklyExpenses/DomainLayer/Abs_Repositry/absrepositry.dart';
import 'package:WeeklyExpenses/DomainLayer/Use_Cases/usecases.dart';
import 'package:WeeklyExpenses/PresentationLayer/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
//intilize
  await Hive.initFlutter();
//open Hive box
  await Hive.openBox('items_database');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AbsDataSource absDataSource = DataSource();
    AbsRepositry absRepositry = MainRepositry(absDataSource);
    return ChangeNotifierProvider(
      create: (context) => UseCase(absRepositry),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
