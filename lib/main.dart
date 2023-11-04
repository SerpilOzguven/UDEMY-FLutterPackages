
import 'package:flutter/material.dart';
import 'package:flutter_packages/packages/hive/amountPage.dart';

import 'package:flutter_packages/packages/hive/model/amount.dart';
import 'package:hive_flutter/hive_flutter.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AmountModelAdapter());
  await Hive.openBox<AmountModel>('amount');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Packages',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const AmountPage(),
    );
  }
}


