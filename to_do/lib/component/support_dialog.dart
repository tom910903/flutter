import 'package:flutter/material.dart';

class SupportDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.fromLTRB(20,100,20,0),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close)
                  ),
                  Expanded(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
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
                        hintText: 'Title',
                        hintStyle: TextStyle(
                            fontSize: 14, color: Colors.grey),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 20,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(
                        Radius.circular(35.0),
                      ),
                    ),
                    hintText: 'Description',
                    hintStyle: TextStyle(
                        fontSize: 14, color: Colors.grey),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              TextButton(
                  onPressed: (){},
                  child: Text('??? ??? ??? ???'))
            ],
          ),
        ),
      );
  }

}