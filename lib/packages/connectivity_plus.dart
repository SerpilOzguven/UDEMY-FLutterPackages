
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityPlusPage extends StatefulWidget {
  const ConnectivityPlusPage({super.key});

  @override
  State<ConnectivityPlusPage> createState() => _ConnectivityPlusPageState();
}

class _ConnectivityPlusPageState extends State<ConnectivityPlusPage> {

  var connectivity;
  var color = Colors.red;

  @override
  void initState() {
    super.initState();
    connectivity = Connectivity().onConnectivityChanged.listen((event) {
      if(event == ConnectivityResult.mobile){
        color = Colors.green;
      }else if(event == ConnectivityResult.none){
        color = Colors.purple;
      }
      setState(() {

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: ()async{
            var test = await (Connectivity().checkConnectivity());
            print(test);
          },
          child: Container(
            color: Colors.red,
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
