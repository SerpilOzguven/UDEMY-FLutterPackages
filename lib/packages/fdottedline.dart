import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';

class FdottedLinePage extends StatefulWidget {
  const FdottedLinePage({super.key});

  @override
  State<FdottedLinePage> createState() => _FdottedLinePageState();
}

class _FdottedLinePageState extends State<FdottedLinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FdottedLine Paketi'),
      ),
      body: Center(
        child: FDottedLine(
          color: Colors.lightBlue[600]!,
          height: 170.0,
          width: 170.0,
          strokeWidth: 2.0,
          dottedLength: 10.0,
          space: 2.0,

          /// Set corner
          corner: FDottedLineCorner.all(10),
        ),
      ),

    );
  }
}
