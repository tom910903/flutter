import 'package:flutter/material.dart';
import 'package:study/data/my_location.dart';
import 'package:study/data/network.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  double latitude3 = 0;
  double longitude3 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async{
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');

    var wheatherData = await network.getJsonData();
    print(wheatherData);
  }
  //
  // void fetchData() async {
  //     var myJson = parsingData['weather'][0]['description'];
  //     print(myJson);
  //
  //     var wind = parsingData['wind']['speed'];
  //     print(wind);
  //
  //     var id = parsingData['id'];
  //     print(id);
  //
  //   }
  //
  // }

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
