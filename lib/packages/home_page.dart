import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
      body: GoogleMap(
          onMapCreated: (controller){
            mapController = controller;
            assetsComplete();
          },
          initialCameraPosition:const CameraPosition(target: LatLng(39.7471486,37.0151462), zoom: 10),
          mapType: MapType.normal,
          markers: markers(),
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
}
