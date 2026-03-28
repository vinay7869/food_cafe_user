import 'dart:developer';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  static final stnName = ''.obs;
  static final streetName = ''.obs;
  static final pinCode = ''.obs;
  static final isAreaLoaded = false.obs;

  static Future<void> getLocation() async {
    try {
      log("called getLocation");
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        log('location permission denied');
      } else {
        final Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
        );
        log('latitude -- ${position.latitude.toString()}');
        log('longitude -- ${position.longitude.toString()}');
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (placemarks.isNotEmpty) {
          Placemark location = placemarks[0];

          stnName.value = location.subLocality!;
          streetName.value = location.street!;
          pinCode.value = location.postalCode!;
          isAreaLoaded.value = true;
        } else {
          isAreaLoaded.value = false;
        }
      }
    } catch (e) {
      log("failed to get location -->> $e");
    }
  }
}
