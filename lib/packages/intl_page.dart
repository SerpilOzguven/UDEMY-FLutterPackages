import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class IntlPage extends StatefulWidget {
  const IntlPage({super.key});

  @override
  State<IntlPage> createState() => _IntlPageState();
}

class _IntlPageState extends State<IntlPage> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    var veri = DateTime.now().toIso8601String();
    print(veri);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intl Package')
      ),
      body: Center(
        child: Text(
          DateFormat.yMMMd('tr').format(DateTime.now()).toString(),
          style: const TextStyle(fontSize:30),
          ),
        ),
      );
    }
  }
