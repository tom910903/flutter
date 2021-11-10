//11
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BBANTO',
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: Text("BBANTO"),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/Ryan.gif'),
                radius: 60,
              ),
            ),
            Divider(
              height: 60,
              color: Colors.grey[850],
              thickness: 0.5,
              endIndent: 30,
            ),
            Text('NAME',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('BBANTO',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text('BBANTO POWER LEVEL ',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2
              ),
            ),
            Text('14',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
                height:30
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                    width: 10
                ),
                Text('using lightsaber',
                  style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                  ),
                )
              ],
            ),

            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                    width: 10
                ),
                Text('face here tattoo',
                  style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                  ),
                )
              ],
            ),

            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                    width: 10
                ),
                Text('fire flames',
                  style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                  ),
                )
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/Apeach.png'),
                radius: 40,
                backgroundColor: Colors.amber[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
