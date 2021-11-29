import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getLocation() async{


    Map<Permission, PermissionStatus> permissions = await [Permission.location].request();


    // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // print(position);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: (){
            getLocation();
          },
          child: Text(
            'Get my location',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}
