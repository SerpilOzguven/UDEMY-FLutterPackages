

import 'package:flutter/material.dart';
import 'package:flutter_packages/packages/sqflite/database_helper.dart';


class SqflitePage extends StatefulWidget {
  const SqflitePage({super.key});

  @override
  State<SqflitePage> createState() => _SqflitePageState();
}

class _SqflitePageState extends State<SqflitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqflite'),
        actions: [
          IconButton(onPressed: ()async{
            await DatabaseHelper.instance.addUser();
          }, icon: const Icon(Icons.add_circle_outline_outlined))
        ],
      ),
      body: Container(),
    );
  }
}
