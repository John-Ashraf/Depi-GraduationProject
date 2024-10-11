import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentPosition() async {
  int maxRetries = 3;
  int retryDelay = 5; // Retry delay in seconds

  for (int i = 0; i < maxRetries; i++) {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        forceAndroidLocationManager: true,
        timeLimit: const Duration(seconds: 30),
      );
      return position;
    } catch (e) {
      if (i < maxRetries - 1) {
        print("Retry attempt $i failed. Retrying in $retryDelay seconds...");
        await Future.delayed(Duration(seconds: retryDelay));
      } else {
        throw e;
      }
    }
  }

  // If all retries fail, throw an exception
  throw Exception("Could not get current position");
}