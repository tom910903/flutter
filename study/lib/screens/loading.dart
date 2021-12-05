import 'package:flutter/material.dart';
import 'package:study/data/my_location.dart';
import 'package:study/data/network.dart';
import 'package:study/screens/weatherscreen.dart';
const apiKey = '0d0cc1131b44cd6ea0027e60e69dc007';

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

    Network network = Network('https://api.openweathermap.org/data/2.5/weather'
        '?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric');

    var weatherData = await network.getJsonData();
    print(weatherData);

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WeatherScreen(parseWeatherData : weatherData);
    }));
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
