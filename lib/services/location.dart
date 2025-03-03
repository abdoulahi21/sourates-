import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
 class LocationService {
  Future<Position?> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Vérifier si la localisation est activée
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Les services de localisation sont désactivés.');
  }

  // Vérifier la permission
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Permission de localisation refusée.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Les permissions de localisation sont définitivement refusées.');
  }

  // Obtenir la position actuelle
  return await Geolocator.getCurrentPosition();
}
}