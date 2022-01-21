import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class PageDialScreen extends StatefulWidget {

  @override
  State<PageDialScreen> createState() => _PageDialScreenState();
}

class _PageDialScreenState extends State<PageDialScreen> {
  List<PageModel> _pageModel= [
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
          child: ReorderableListView(
            children: [
              for (final item in _pageModel)
                ListTile(
                  key: ValueKey(item),
                  leading: Icon(item.ListIcon),
                  title: Text(item.Title,
                    style: TextStyle(
                        fontSize: 15.sp
                    ),
                  ),
                  trailing: Icon(Icons.dehaze),
                )
            ],

            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (newIndex > oldIndex) {
                  newIndex = newIndex - 1;
                }
                final item = _pageModel.removeAt(oldIndex);
                _pageModel.insert(newIndex, item);
              });
            },
          )
      ),
    );
  }
}
