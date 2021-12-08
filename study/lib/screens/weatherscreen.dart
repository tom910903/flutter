import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:study/model/model.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData, this.parseAirPollution});
  final dynamic parseWeatherData;
  final dynamic parseAirPollution;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Model model = Model();
  String cityName = "";
  int temp = 0;
  Widget icon = Text('');
  String des = "";
  Widget airIcon = Text('');
  Widget airState = Text('');
  double dust1 = 0;
  double dust2 = 0;
  var date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData, widget.parseAirPollution);
  }

  void updateData(dynamic weatherData, dynamic airData) {
    double temp2 = weatherData['main']['temp'].toDouble();
    int condition = weatherData['weather'][0]['id'];
    int index = airData['list'][0]['main']['aqi'];
    des = weatherData['weather'][0]['description'];
    dust1 = airData['list'][0]['components']['pm10'].toDouble;
    dust2 = airData['list'][0]['components']['pm2_5'].toDouble;
    temp = temp2.round();
    cityName = weatherData['name'];
    icon = model.getWeatherIcon(condition);
    airIcon = model.getAirIcon(index);
    airState = model.getAirCondition(index);

    print(temp);
    print(cityName);
  }

  String getSystemTime(){
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: (){},
          iconSize: 30,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: (){},
            iconSize: 30,
          )
        ],
      ),
      body: Container(
        child: Stack(
            children: [
              Image.asset('image/background.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150,
                              ),
                              Text('$cityName',
                                style: GoogleFonts.lato(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                              Row(
                                  children: [
                                    TimerBuilder.periodic(
                                      (Duration(minutes: 1)),
                                      builder: (context){
                                        print(getSystemTime());
                                        return Text(getSystemTime(),
                                          style: GoogleFonts.lato(
                                              fontSize: 16,
                                              color: Colors.white
                                          ),
                                        );
                                      },
                                    ),
                                    Text(
                                        DateFormat(' - EEEE, ').format(date),
                                        style: GoogleFonts.lato(
                                            fontSize: 16,
                                            color: Colors.white
                                        )
                                    ),
                                    Text(
                                        DateFormat('d MMM, yyy').format(date),
                                        style: GoogleFonts.lato(
                                            fontSize: 16,
                                            color: Colors.white
                                        )
                                    ),

                                  ]
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$temp\u2103',
                          style: GoogleFonts.lato(
                              fontSize: 85,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          ),
                        ),

                        Row(
                          children: [
                            icon,
                            SizedBox(
                              width: 10,
                            ),
                            Text('$des',
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Divider(
                          height: 15,
                          thickness: 2,
                          color: Colors.white30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('AQI(대기질 지수)',
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      color: Colors.white
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                airIcon,
                                SizedBox(
                                  height: 10,
                                ),
                                airState,
                              ],
                            ),
                            Column(
                              children: [
                                Text('미세먼지',
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      color: Colors.white
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('$dust1',
                                  style: GoogleFonts.lato(
                                      fontSize: 24,
                                      color: Colors.white
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('㎍/m3',
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text('초미세먼지',
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      color: Colors.white
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('$dust2',
                                  style: GoogleFonts.lato(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('㎍/m3',
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}