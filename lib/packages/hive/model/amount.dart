

import 'package:hive_flutter/hive_flutter.dart';

part 'amount.g.dart';



@HiveType(typeId: 0)
class AmountModel extends HiveObject {
  @HiveField(0)
  late String name;


  @HiveField(1)
  late double age;

  @HiveField(3)
  late double amount;

  @HiveField(2)
  late bool isPlus;

}

