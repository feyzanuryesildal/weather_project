import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather_project/services/location_services.dart';
import 'package:weather_project/view/mainScreensView.dart';

class weatherView extends StatefulWidget {
  const weatherView({Key? key}) : super(key: key);

  @override
  State<weatherView> createState() => _weatherViewState();
}

class _weatherViewState extends State<weatherView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }
  
  Future<void> getLocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionLocation;
    LocationData _locData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionLocation = await location.hasPermission();
    if (_permissionLocation == PermissionStatus.denied) {
      _permissionLocation = await location.requestPermission();
      if (_permissionLocation != PermissionStatus.granted) {
        return;
      }

    }
    _locData = await location.getLocation();
    setState(() {
      userLocation.lat= _locData.latitude!;
      userLocation.long = _locData.longitude!;
    });
    
    Timer(Duration(milliseconds: 500), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => mainScreenView()));
    });
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
        ),
      );
    }
  }

