import 'package:geolocator/geolocator.dart';

class Location {
  double _latitude = 0.0;
  double _longitude = 0.0;
  Future<void> getLocation() async {
    try {
      Position pos = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      _latitude = pos.latitude;
      _longitude = pos.longitude;
    } catch (e) {
      print(e.toString());
    }
  }

  double getLat() {
    return _latitude;
  }

  double getLong() {
    return _longitude;
  }
}
