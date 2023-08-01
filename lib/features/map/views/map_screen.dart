import 'dart:async';
import 'package:chat_app/core/constants/app_texts/app_texts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../layout/custom_appbar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;

  @override
  void initState() {
    checkGps();
    super.initState();
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
          Geolocator.requestPermission();
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    long = position.longitude.toString();
    lat = position.latitude.toString();

    setState(() {
      //refresh UI
    });

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      print(position.longitude);
      print(position.latitude);

      long = position.longitude.toString();
      lat = position.latitude.toString();

      setState(() {
        //refresh UI on update
      });
    });
    final CollectionReference locationsCollection =
        FirebaseFirestore.instance.collection('locations');
    locationsCollection.add({
      'longitude': position.longitude,
      'latitude': position.latitude,
      'timestamp': FieldValue
          .serverTimestamp(), // To add server timestamp for when the data was uploaded
    }).then((value) {
      print("Location data uploaded to Firebase: ${value.id}");
    }).catchError((error) {
      print("Error uploading location data: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppTexts.location),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Text(servicestatus ? "GPS is Enabled" : "GPS is disabled."),
            Text(haspermission ? "GPS is Enabled" : "GPS is disabled."),
            Text("Longitude: $long", style: const TextStyle(fontSize: 20)),
            Text(
              "Latitude: $lat",
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
