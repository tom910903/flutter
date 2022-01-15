import 'package:flutter/material.dart';
import 'package:to_do/screen/main_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.w, 80.h, 30.w, 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 180.h,
                  child: Image.asset(
                      'images/img_logo.png', fit: BoxFit.contain),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(35.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(
                        Radius.circular(35.0),
                      ),
                    ),
                    hintText: 'user@email.com',
                    hintStyle: TextStyle(
                        fontSize: 14, color: Colors.grey),
                    contentPadding: EdgeInsets.all(10.w),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    // errorText: 'ID or Password are not matched',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(35.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(
                        Radius.circular(35.0),
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(
                        Radius.circular(35.0),
                      ),
                    ),
                    hintText: 'password',
                    hintStyle: TextStyle(
                        fontSize: 14, color: Colors.grey),
                    contentPadding: EdgeInsets.all(10.w),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 40.h,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return MainScreen();
                          })
                      );
                    },
                    child: Text("Log in",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        )
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Finding ID or PW",
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      )
                  ),
                ),
                Text("Or sign in with : ",
                  textAlign: TextAlign.center,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: () {},
                          icon: Icon(Icons.add_shopping_cart,
                            size: 40.w,)),
                      VerticalDivider(
                        thickness: 1, color: Colors.black,),
                      IconButton(onPressed: () {},
                          icon: Icon(Icons.add_shopping_cart,
                            size: 40.w,)),
                    ]
                ),
                SizedBox(
                  height: 10.w,
                ),
                SizedBox(
                  height: 40.h,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Sign in",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(35.0),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}