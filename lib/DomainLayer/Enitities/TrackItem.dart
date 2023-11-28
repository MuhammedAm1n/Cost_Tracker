import 'package:equatable/equatable.dart';

class Trackitem extends Equatable {
  final String amount;
  final DateTime date;
  final String name;

  Trackitem({required this.amount, required this.date, required this.name});

  @override
  List<Object?> get props => [amount, date, name];
}
