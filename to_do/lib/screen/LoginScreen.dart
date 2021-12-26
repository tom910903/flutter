import 'dart:ui';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50,30,50,30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('images/img_logo.png', fit:BoxFit.contain),
              ),
              SizedBox(
                height: 10,
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
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                textAlign: TextAlign.center,
                decoration:  InputDecoration(
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
                  hintText: 'user@email.com',
                  hintStyle: TextStyle(
                      fontSize: 14, color: Colors.grey),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("ID or Password are not matched",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: TextButton(
                  onPressed: (){},
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
                onPressed: (){},
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
                  children : [
                    IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart)),
                    VerticalDivider(thickness: 1, color: Colors.black,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart)),
                  ]
              ),
              SizedBox(
                height: 50,
                child: TextButton(
                  onPressed: (){},
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
    );
  }
}
