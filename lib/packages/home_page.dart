// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.

import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  final controller = TextEditingController();
  File files?
  var battery = Battery();

  var appName = "";
  var packageName = "";
  var version = "";
  var builderNumber = "";
  var buildSignature = "";

  var info2 = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
    getBattery();


  }

  GoogleMapController? mapController;
  var deger;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
      FloatingActionButton(onPressed: (){
        goNewPosition();
      },
        child: const Icon(Icons.location_on),),
      appBar: AppBar(
        title: const Text('Google Maps Flutter'),
      ),

      body: StreamBuilder<BatteryState>(
        stream: battery.onBatteryStateChanged,
        builder:(context,snapshot){
          if (!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(),
          } else {
            return Center(child: Text(snapshot,data!.name.indexed.toString()),);
    }
          }),
        },

        child: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(hintText:'Yazý yazýnýz',border: OutlinedBorder()),
            ),

            ElevatedButton(onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null) {
                files = File(result.files.single.path!);
              } else {
                // User canceled the picker
              }

            }, child: Text('Fotoðraf Yükle'),),


            ElevatedButton(onPressed: () async {
              if(controller.text.isEmpty && files !=null ) {
                print('boþ býrakmayýnýz');
              }else{
                await Share.shareXFiles([files!.path],text: controller.text);
              }
            }, child: Text('Fotoðraf Paylaþ')),


            Text(appName),
            Text(builderNumber),
            Text(buildSignature),
            Text(packageName),
            Text(version),
            Text(info2),

            GoogleMap(
                onMapCreated: (controller){
                  mapController = controller;
                  assetsComplete();
                },
                initialCameraPosition:const CameraPosition(target: LatLng(39.7471486,37.0151462), zoom: 10),
                mapType: MapType.normal,
                markers: markers(),

            ),
          ],
        ),
      ),
    );
  }

  goNewPosition(){
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          const CameraPosition(
            target: LatLng(39.7471486,37.0151462,), zoom: 13),),);
  }
  Set<Marker> markers() {
    return {
      const Marker(
        markerId: MarkerId('1'),
        position: LatLng(39.7471486, 37.0151462),
        icon: BitmapDescriptor.defaultMarker,
      ),
      Marker(
        markerId: const MarkerId('2'),
        position: const LatLng(38.7471486, 36.0151462),
        icon: deger ?? BitmapDescriptor.defaultMarker,
      ),
    };
  }
  Future<void> assetsComplete() async {
    var bitMap = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2), 'assets/car.png');
    setState(() {
      deger = bitMap;
    });
  }

  void getInfo() async {
    var info = await deviceInfo.androidInfo;
    info2 = info.version.release;
    print(info2);
    setState(() {});


    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    builderNumber = packageInfo.buildNumber;
    buildSignature = packageInfo.buildSignature;
    packageName = packageInfo.packageName;
    version = packageInfo.version;



  }

  Future<void> getBattery() async {
    print(await battery.batteryLevel);
    print(battery.isbatterysavemode);

  }
}
// paketler çalýþýrken sayfaya sýðmýyor.Google Maps için API ücretli!