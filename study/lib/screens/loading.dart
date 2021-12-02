import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    fetchData();
  }

  void getLocation() async{

    Map<Permission, PermissionStatus> permissions = await [Permission.locationWhenInUse].request();

    try {
      if (permissions[Permission.locationWhenInUse] ==
          PermissionStatus.granted) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        print(position);
      }
    }catch(e){
      print('Error!!!');
    }
  }

  void fetchData() async {
    Response response = await get(Uri.parse('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1'));

    if(response.statusCode == 200){
      String jsonData = response.body;
      var myJson = jsonDecode(jsonData)['weather'][0]['description'];
      print(myJson);

      var wind = jsonDecode(jsonData)['wind']['speed'];
      print(wind);

      var id = jsonDecode(jsonData)['id'];
      print(id);

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: null
          //     (){
          //   getLocation();
          // }
          ,
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
