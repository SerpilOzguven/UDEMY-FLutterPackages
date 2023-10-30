import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocatorPage extends StatefulWidget {
  const GeoLocatorPage({super.key});

  @override
  State<GeoLocatorPage> createState() => _GeoLocatorPageState();
}

class _GeoLocatorPageState extends State<GeoLocatorPage> {

  @override
  void initState() {
    super.initState();
    givePermission();
  }

  givePermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied &&
        permission == LocationPermission.deniedForever)
    await Geolocator.requestPermission();
  }

  final LocationSettings locationSettings = AndroidSettings(
    accuracy: LocationAccuracy.best,
    distanceFilter: 0,
    timeLimit: const Duration(hours: 4),
    intervalDuration: const Duration(seconds: 60),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('GEO LOCATOR'),
        ),
        body: StreamBuilder<ServiceStatus>(
          stream:
          Geolocator.getServiceStatusStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              //print(snapshot.data);
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data!.name,
                      style: const TextStyle(fontSize: 40),

                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              );
            }
          },
        )
    );
  }
  /*
  StreamBuilder<Position>(
    stream:
      Geolocator.getPositionStream(locationSettings: locationSettings),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
      print(snapshot.error);
        return const Center(
      child: CircularProgressIndicator(),
      );
    } else {
      return Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              snapshot.data!.latitude.toString(),
              style: const TextStyle(fontSize: 40),

            ),
            const SizedBox(
            height: 50,
            ),
            Text(
            snapshot.data!.longitude.toString(),
            style: const TextStyle(fontSize: 40),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: 300,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                locationMethod();
                },
                child: const Text(
                'Location',
                style: TextStyle(fontSize: 24),
              ),
            ),
          )
        ],
      ),
     );
    }
  },
 )

   */
  void locationMethod() async {
    //await Geolocator.openLocationSettings();
    //await Geolocator.openAppSettings();
    //var deger = Geolocator.isLocationServiceEnabled();
    //print(deger);
    //await Geolocator.requestPermission();
    //await Geolocator.checkPermission();
    //var deger = Geolocator.distanceBetween(40.9986021, 39.7586372, 40.9894836, 39.7881409);
    //var deger = Geolocator.bearingBetween(40.9986021, 39.7586372, 40.9894836, 39.7881409);
    //var deger = Geolocator.getLastKnownPosition();
    //var deger = Geolocator.getCurrentPosition();
    //print(deger);
  }
}
