import 'package:geolocator/geolocator.dart';

class LocationType {
  double _latitude = 0.0;
  double _longitude = 0.0;
  Future<void> getLocation() async {
    try {
      print("Opening GeoLocator...");
      Position curLoc = await Geolocator().getCurrentPosition();
      _latitude = curLoc.latitude;
      _longitude = curLoc.longitude;
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
