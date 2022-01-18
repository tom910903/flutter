import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeModel{
  String _title = "";
  String _img = "";
  Color _color = Colors.blue;
  String _price = "";

  get Title => _title;
  get Img => _img;
  get BackgroundColor => _color;
  get Price => _price;

  ThemeModel(String title, String img, Color color, String price){
    _title = title;
    _img = img;
    _color = color;
    _price = price;
  }
}

class ThemeScreen extends StatelessWidget {

  List<ThemeModel> themeList= [
    ThemeModel("White",'images/Apeach.png',Colors.white, '1000원'),
    ThemeModel("Dark",'images/Apeach.png',Colors.grey, '1100원'),
    ThemeModel("Blue",'images/Apeach.png',Colors.blue, '1200원'),
    ThemeModel("Red",'images/Apeach.png',Colors.red, '1300원'),
    ThemeModel("Amber",'images/Apeach.png',Colors.amber, '1400원'),
    ThemeModel("White",'images/Apeach.png',Colors.white, '1000원'),
    ThemeModel("Dark",'images/Apeach.png',Colors.grey, '1100원'),
    ThemeModel("Blue",'images/Apeach.png',Colors.blue, '1200원'),
    ThemeModel("Red",'images/Apeach.png',Colors.red, '1300원'),
    ThemeModel("Amber",'images/Apeach.png',Colors.amber, '1400원'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Theme",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(16.0),
            childAspectRatio: 8.0 / 9.0,

            children: List.generate(themeList.length, (index){
              return Card(
                color: themeList[index].BackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Image.asset(
                        themeList[index].Img,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Text(themeList[index].Title,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(themeList[index].Price),
                    SizedBox(height: 10,),
                  ],
                ),
              );
            }
            ) // _buildGridCards(context),
        ),
      ),
    );
  }
}
