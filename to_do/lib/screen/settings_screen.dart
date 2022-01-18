import 'package:flutter/material.dart';
import 'package:to_do/screen/notice_list_screen.dart';
import 'package:to_do/screen/user_support_screen.dart';
import 'package:to_do/screen/business_support_screen.dart';
import 'package:to_do/screen/theme_screen.dart';

enum SETTINGS{
  NOTICE,
  THEME,
  PAGE_DIAL,
  USER_SUPPORT,
  BUSINESS_SUPPORT,
  PERSONAL_INFORMATION,
  DEACTIVE_ACCOUNT,
  MAX
}

class SettingsModel{
  String _title = "";
  IconData _icon = Icons.settings;
  SETTINGS _index = SETTINGS.MAX;

  get Title => _title;
  get Icon => _icon;
  get Index => _index;

  SettingsModel(String title, IconData icon, SETTINGS index){
    _title = title;
    _icon = icon;
    _index = index;
  }
}

class SettingsScreen extends StatelessWidget {

  List<SettingsModel> settingsList= [
    SettingsModel("Notice",Icons.notifications,SETTINGS.NOTICE),
    SettingsModel("Theme",Icons.ad_units,SETTINGS.THEME),
    SettingsModel("Page Dial",Icons.account_tree,SETTINGS.PAGE_DIAL),
    SettingsModel("User Support",Icons.people,SETTINGS.USER_SUPPORT),
    SettingsModel("Business Support",Icons.domain,SETTINGS.BUSINESS_SUPPORT),
    SettingsModel("Personal Information",Icons.person,SETTINGS.PERSONAL_INFORMATION),
    SettingsModel("Deactive Account",Icons.account_circle,SETTINGS.DEACTIVE_ACCOUNT)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings",
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
              title: Text(settingsList[index].Title,
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              leading: Icon(settingsList[index].Icon, size: 30,),

              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      switch(SETTINGS.values[index]){
                        case SETTINGS.NOTICE:
                          return NoticeListScreen();
                        case SETTINGS.THEME:
                          return ThemeScreen();
                        case SETTINGS.PAGE_DIAL:
                          return NoticeListScreen();
                        case SETTINGS.USER_SUPPORT:
                          return UserSupportScreen();
                        case SETTINGS.BUSINESS_SUPPORT:
                          return BusinessSupportScreen();
                        case SETTINGS.PERSONAL_INFORMATION:
                          return NoticeListScreen();
                        case SETTINGS.DEACTIVE_ACCOUNT:
                          return NoticeListScreen();
                        default:
                          return NoticeListScreen();
                      }
                    })
                );
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: SETTINGS.MAX.index,
        ),
      ),
    );
  }
}
