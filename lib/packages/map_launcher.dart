// TODO Implement this library.// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_launcher/map_launcher.dart';

class MapLauncherPage extends StatefulWidget {
  const MapLauncherPage({super.key});

  @override
  State<MapLauncherPage> createState() => _MapLauncherPageState();
}

class _MapLauncherPageState extends State<MapLauncherPage> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Launcher'),

      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              showMarkerMethod();
            }, child: const Text('Show Marker')),
            ElevatedButton(onPressed: (){
              showDirectionsMethod();
            }, child: const Text('Show Directions'))
          ],
        ),
      ),
    );
  }

  void getLocation() async{
    var permission = Geolocator.checkPermission();
    print(permission);
    if(permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always){
      Geolocator.requestPermission();
    }

  }

  void showMarkerMethod() async {
    bool? deger = await MapLauncher.isMapAvailable(MapType.google);
      if (deger!) {
        var deger = await Geolocator.getCurrentPosition();
        MapLauncher.showMarker(
            mapType: MapType.google,
            coords: Coords(40.881305, 29.2204543),
            title: 'Baþlangýc Noktasý',
        );
    }

  }

  Future<void> showDirectionsMethod() async {
    bool? deger = await MapLauncher.isMapAvailable(MapType.google);
    if(deger!) {
      MapLauncher.showDirections(
        mapType: MapType.google,
        origin: Coords(40.981305, 29.9204543),
        destination: Coords(40.881305, 29.2204543),

      );
    }
  }
}
