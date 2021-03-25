import 'package:flutter/foundation.dart';

class Transaction {
  final String id; // final means at run time value do not change
  final String title;
  final double amount;
  final DateTime date;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
