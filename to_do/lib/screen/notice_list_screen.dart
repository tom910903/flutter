import 'package:flutter/material.dart';

class NoticeModel{
  String _title = "";
  String _date = "";
  String _uid = "";
  bool _isImportant = false;
  Color _color = Colors.black;

  get Title => _title;
  get IsImportant => _isImportant;
  get Date => _date;
  get Uid => _uid;
  get TextColor => _color;

  NoticeModel(String title, String date, String uid, {bool isImportant = false})
  {
    _title = title;
    _date = date;
    _uid = uid;
    _isImportant = isImportant;
    if(_isImportant){
      _color = Colors.red;
    }
  }
}

class NoticeListScreen extends StatelessWidget {

  List<NoticeModel> noticeModel= [
    NoticeModel("Notice1","2020.03.23","", isImportant : true),
    NoticeModel("Notice2","2020.03.23","", ),
    NoticeModel("Notice3","2020.03.23","", ),
    NoticeModel("Notice4","2020.03.23","", ),
    NoticeModel("Notice5","2020.03.23","", ),
    NoticeModel("Notice6","2020.03.23","", ),
    NoticeModel("Notice7","2020.03.23","", isImportant : true),
    NoticeModel("Notice8","2020.03.23","", ),
    NoticeModel("Notice9","2020.03.23","", ),
    NoticeModel("Notice10","2020.03.23","", ),
    NoticeModel("Notice11","2020.03.23","", ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notice",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(noticeModel[index].Title,
                style: TextStyle(
                    // fontSize: 20
                  color: noticeModel[index].TextColor
                ),
              ),
              subtitle: Text(noticeModel[index].Date,)

              // onTap: (){
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context){
              //         // return ();
              //       }
              //       )
              //   );
              // },
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: noticeModel.length,
        ),
      ),
    );
  }
}
