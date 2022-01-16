import 'package:flutter/material.dart';
import 'package:to_do/screen/settings_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RightDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 540.w,
      // MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/Apeach.png'),
                backgroundColor: Colors.white,
              ),
              accountName: Text('Name'),
              accountEmail: Text('email@eamil.com'),
              // onDetailsPressed: () {
              //   print('arrow is clicked');
              // },
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        color: Colors.grey,
                        spreadRadius: 3,
                        blurRadius: 10
                    )
                  ]
              ),
              child: IconButton(
                  onPressed: (){
                    print("share");
                  },
                  icon: Icon(Icons.share,size: 50,)
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        color: Colors.grey,
                        spreadRadius: 3,
                        blurRadius: 10
                    )
                  ]
              ),
              child: IconButton(
                  onPressed: (){
                    print("shopping_cart");
                  },
                  icon: Icon(Icons.shopping_cart,size: 50,)
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        color: Colors.grey,
                        spreadRadius: 3,
                        blurRadius: 10
                    )
                  ]
              ),
              child: IconButton(
                  onPressed: (){
                    print("shop");
                  },
                  icon: Icon(Icons.addchart_rounded,size: 50,)
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        color: Colors.grey,
                        spreadRadius: 3,
                        blurRadius: 10
                    )
                  ]
              ),
              child: IconButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return SettingsScreen();
                        })
                    );
                  },
                  icon: Icon(Icons.settings,size: 50,)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
