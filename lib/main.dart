import 'package:flutter/material.dart';
import 'package:flutter_packages/packages/hive/model/amount.dart';
import 'package:flutter_packages/packages/sqflite/sqflite_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_packages/packages/hive/amountPage.dart';
/*
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AmountModelAdapter());
  Hive.openBox<AmountModel>('amount');
  runApp(const MyApp());
}

 */

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super (key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Packages',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const SqflitePage(),
    );
  }
}



