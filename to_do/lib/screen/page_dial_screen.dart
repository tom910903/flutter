import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
class PageModel{
  String _title = "";
  IconData _icon = Icons.alarm;
  String _uid = "";

  get Title => _title;
  get ListIcon => _icon;
  get Uid => _uid;

  PageModel(String title, IconData icon, String uid) {
    _title = title;
    _icon = icon;
    _uid = uid;
  }
}

class PageDialScreen extends StatelessWidget {

  List<PageModel> noticeModel= [
    PageModel("Item1",Icons.ac_unit,"",),
    PageModel("Item2",Icons.theaters,"",),
    PageModel("Item3",Icons.shop,"",),
    PageModel("Item4",Icons.home,"",),
    PageModel("Item5",Icons.account_balance,"",),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Page Dial",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(noticeModel[index].ListIcon),
                title: Text(noticeModel[index].Title,
                  style: TextStyle(
                     fontSize: 15.sp
                  ),
                ),
              trailing: Icon(Icons.dehaze),
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
