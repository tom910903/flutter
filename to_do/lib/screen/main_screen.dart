import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:to_do/screen/title_bar.dart';
import 'right_drawer.dart';

class MainScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(),
      endDrawer: RightDrawer(),
      endDrawerEnableOpenDragGesture: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView(
                children: [
                  GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.8,
                    children: List.generate(4, (index) {
                      return OutlinedButton(
                          onPressed: (){
                            _scaffoldKey.currentState!.openEndDrawer();
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_a_photo_sharp),
                              Text("data")
                            ],
                          )
                      );
                    }),

                  )
                  // Text("page2",),
                  // Text("page3",),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Text('$index',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemCount: 20,
              ),
            ),
            LinearPercentIndicator(
              // width: 140.0,
              lineHeight: 14.0,
              percent: 0.5,
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, size: 50, color: Colors.blue,),
      ),
    );
  }
}