import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:to_do/component/support_dialog.dart';

class BusinessSupportScreen extends StatelessWidget {
  const BusinessSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Business Support",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAnimatedDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return SupportDialog();
            },
            animationType: DialogTransitionType.slideFromBottom,
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, size: 50, color:  Colors.blue,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('ssssss'
              ),
              subtitle: Text('2022-01-01',
              ),
              // leading: Icon(settingsList[index].Icon, size: 30,),

              onTap: (){
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context){}
                //     )
                // );
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: 20,
        ),
      ),
    );
  }
}
