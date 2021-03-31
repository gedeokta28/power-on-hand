import 'package:location/location.dart';
import 'package:oktoast/oktoast.dart';

class GPSUtils {
  static Future getCurrentLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        showToast('Service is not enabled');
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        showToast('Permission is not granted');
        return;
      }
    }

    var locData = await location.getLocation();
    return LatLng(locData.latitude, locData.longitude);
  }
}

class LatLng {
  double latitude;
  double longitude;
  LatLng(this.latitude, this.longitude);
}
