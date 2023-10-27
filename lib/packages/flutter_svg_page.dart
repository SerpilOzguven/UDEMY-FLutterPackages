
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlutterSvgPage extends StatefulWidget {
  const FlutterSvgPage({super.key});

  @override
  State<FlutterSvgPage> createState() => _FlutterSvgPageState();
}

class _FlutterSvgPageState extends State<FlutterSvgPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
       child: Column(
         children: [
           /*
           Image.network('https://unsplash.com/photos/mens-black-jacket-pe-X2NUwVQo',
               fit: BoxFit.cover,
               height: 1500,
           ),
            */
           SvgPicture.asset(
             'assets/monarch.svg',
             height:2000,
             fit: BoxFit.cover,
           ),
         ],
       ),
     ),
    );
  }
}
