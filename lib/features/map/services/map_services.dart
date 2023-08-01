import 'package:cloud_firestore/cloud_firestore.dart';

class LocationServices {
  static Future<void> saveUserLocation(
      String userId, String latitude, String longitude) async {
    await FirebaseFirestore.instance.collection('location').doc(userId).set({
      'latitude': latitude,
      'longitude': longitude,
    });
  }
}
