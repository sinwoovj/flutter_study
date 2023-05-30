import 'dart:async';

import 'package:choolcheck/constant.dart';
import 'package:choolcheck/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'enum.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

double lowerCamelCase = 1000;

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  bool isInside = false;
  CameraPosition initialCamera = CameraPosition(
    target: myCompany, //위도 경도
    zoom: 14.4746,
  );
  Circle circle = Circle(
      circleId: CircleId('my_circle'),
      center: myCompany,
      radius: lowerCamelCase,
      fillColor: Colors.red.withOpacity(0.3),
      strokeColor: Colors.red.withOpacity(0.6),
      strokeWidth: 3);
  Marker marker = Marker(
    markerId: MarkerId('my_marker'),
    position: myCompany,
  );
//  Stream serviceStatusStream = Geolocator.getServiceStatusStream();

  Future<Permission> _getPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Permission.unAble;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Permission.denied;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Permission.deniedForever;
    }
    return Permission.permitted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: buildMap(),
          ),
          Expanded(
              flex: 5,
              child: Center(
                child: InkWell(
                  onTap: onClickButton,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text('출첵'),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Future<void> onClickButton() async {
    if (!isInside) {
      showToast("아직 회사에 도착하지 않았습니다.");
      return;
    }
    bool? result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('출석체크'),
        content: const Text('출석체크를 하시겠습니까?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('네'),
          ),
        ],
      ),
    );
    print('result : $result');
    if (result ?? false) {
      ///toast
      showToast("회사 출근 완료!");
    }
  }

  FutureBuilder<Permission> buildMap() {
    return FutureBuilder(
      future: _getPermission(),
      builder: (BuildContext context, AsyncSnapshot<Permission> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return Text('데이터 없음');
        }
        Permission permission = snapshot.data!;

        if (permission == Permission.permitted) {
          return StreamBuilder(
              stream: Geolocator.getPositionStream(),
              builder: (context, AsyncSnapshot<Position> snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }
                Position myPosition = snapshot.data!;
                double distanceInMeters = Geolocator.distanceBetween(myPosition.latitude,
                    myPosition.longitude, myCompany.latitude, myCompany.longitude);
                isInside = distanceInMeters < lowerCamelCase;
                print('isInside : $isInside');
                return GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: initialCamera,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  circles: {
                    isInside
                        ? circle.copyWith(
                            fillColorParam: Colors.greenAccent.withOpacity(0.3),
                            strokeColorParam: Colors.greenAccent.withOpacity(0.6),
                          )
                        : circle
                  },
                  markers: {marker},
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                );
              });
        } else {
          return Text(permission.info);
        }
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        '출근하기 어플',
        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.cyanAccent),
      ),
      backgroundColor: Colors.limeAccent,
    );
  }
}
