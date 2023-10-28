import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';

class FlutterToastPage extends StatefulWidget {
  const FlutterToastPage({super.key});

  @override
  State<FlutterToastPage> createState() => _FlutterToastPageState();
}

class _FlutterToastPageState extends State<FlutterToastPage> {

  FToast? fToast;

  @override
  void initState() {
    super.initState();
    fToast=FToast();
    fToast!.init(context as BuildContext);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Toast'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Fluttertoast.showToast(
                  msg: 'Flutter Toast Ýlk Kullaným',
                  toastLength: Toast.LENGTH_LONG,
                  backgroundColor: Colors.red
              );
            },
                child: const Text('Flutter Default Toast'),
            ),
            ElevatedButton(
              onPressed: (){
              Fluttertoast.cancel();
            },
              child: const Text('Flutter Default Toast Remove'),
            ),
            ElevatedButton(onPressed: () {
              fToast!.showToast(
                gravity: ToastGravity.CENTER_RIGHT,
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.green,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){},
                          icon: Icon(
                          Icons.check)),
                      Text('Ýþlem baþarýlý', style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                toastDuration: const Duration(seconds: 3),
              );
            },
              style: ElevatedButton.styleFrom(
                  primary: Colors.green),
              child: const Text(
                  'Flutter Default Toast Remove'
              ),
            ),
            ElevatedButton(onPressed: (){
              style: ElevatedButton.styleFrom(primary: Colors.green);
              fToast!.removeCustomToast();
            }, child: Text('Flutter Our Toast Remove'),
            ),

            ElevatedButton(onPressed: (){
              style: ElevatedButton.styleFrom(primary: Colors.green);
              fToast!.removeQueuedCustomToasts();
            }, child: Text('Flutter Our Toast Remove'),
            ),
          ],
        ),
      ),
    );
  }
}
