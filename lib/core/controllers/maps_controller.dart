import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:power_on_hand/core/controllers/base_controller.dart';
import 'package:power_on_hand/core/utils/gps_utils.dart';

class MapsController extends BaseController {
  static MapsController get to => Get.find();

  double _cameraZoom = 17;
  double get cameraZoom => _cameraZoom;

  double _bearing = 30.0;
  double get bearing => _bearing;

  CameraPosition _cameraPosition;
  CameraPosition get cameraPosition => _cameraPosition;

  LatLng _userCurrentLocation;
  LatLng get sourceLocation => _userCurrentLocation;

  Location location = new Location();

  @override
  void onInit() async {
    super.onInit();
    initLocation();
  }

  Future initCamera() async {
    //Get current locations
    await initLocation();
    //Set current location to camera
    _cameraPosition = CameraPosition(
      zoom: cameraZoom,
      target: sourceLocation,
      bearing: bearing,
    );
    update();
  }

  //Function to get current locations
  Future initLocation() async {
    var locData = await GPSUtils.getCurrentLocation();
    _userCurrentLocation = LatLng(locData.latitude, locData.longitude);
    print('${locData.latitude}, ${locData.longitude}');

    update();
  }
}
