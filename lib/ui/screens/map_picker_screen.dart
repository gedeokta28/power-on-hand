import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/maps_controller.dart';
import 'package:power_on_hand/core/utils/gps_utils.dart';
import 'package:power_on_hand/ui/widgets/primary_button.dart';

class MapPickerScreen extends StatefulWidget {
  @override
  MapPickerScreenState createState() => MapPickerScreenState();
}

class MapPickerScreenState extends State<MapPickerScreen> {
  LatLng lastMapPosition;
  String address;
  bool isCameraMoving;

  @override
  void initState() {
    super.initState();
    isCameraMoving = false;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      lastMapPosition = MapsController.to.sourceLocation;
      if (lastMapPosition != null) {
        var lastAdress = await GPSUtils.getAdress(lastMapPosition);
        setState(() {
          address = lastAdress;
        });
        print(lastMapPosition);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapsController>(
      builder: (_) {
        if (_.cameraPosition == null) {
          _.initCamera();
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Tambah Lokasi'),
          ),
          body: Stack(
            children: <Widget>[
              Container(
                child: GoogleMap(
                  tiltGesturesEnabled: false,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: _.cameraPosition,
                  mapToolbarEnabled: true,
                  myLocationEnabled: true,
                  onCameraIdle: () async {
                    if (lastMapPosition != null) {
                      var res = await GPSUtils.getAdress(lastMapPosition);
                      setState(() {
                        isCameraMoving = false;
                        address = res;
                      });
                    }
                  },
                  onCameraMoveStarted: () {
                    setState(() {
                      isCameraMoving = true;
                    });
                  },
                  onCameraMove: (CameraPosition cameraPosition) {
                    lastMapPosition = cameraPosition.target;
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Icon(
                    FontAwesomeIcons.mapMarkerAlt,
                    color: Styles.primaryColor,
                    size: 40,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: isCameraMoving
                      ? SizedBox()
                      : Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(8),
                          width: Get.width,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Text(
                                  address ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              PrimaryButton(
                                color: Styles.primaryColor,
                                fontColor: Colors.white,
                                title: 'Pilih lokasi ini',
                                onPressed: () {
                                  Get.back(result: lastMapPosition);
                                },
                              )
                            ],
                          ),
                        ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
