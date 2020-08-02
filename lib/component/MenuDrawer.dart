import 'package:epicontrol/constant.dart';
import 'package:epicontrol/screens/CollectScreen.dart';
import 'package:epicontrol/screens/HomeScreen.dart';
import 'package:epicontrol/screens/ManageReportScreen.dart';
import 'package:epicontrol/screens/MapScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 150.0,
            color: kRedColor,
            padding: EdgeInsets.only(top: 15.0, left: 15.0),
            child: Text('UControl',style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25.0, color: kWhiteColor)),
          ),
          ListTile(
            leading: Icon(Icons.home, color: kRedColor),
            title: Text('Home', style: kDrawerStyle),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, HomeScreen.id);
            },
          ),
          kDivider,
          ListTile(
            leading: Icon(Icons.grain, color: kRedColor),
            title: Text('Collect', style: kDrawerStyle),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, CollectScreen.id);
            },
          ),
          kDivider,
          ListTile(
            leading: Icon(Icons.map, color: kRedColor),
            title: Text('Map', style: kDrawerStyle),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, MapScreen.id);
            },
          ),
          kDivider,
          ListTile(
            leading: Icon(Icons.announcement, color: kRedColor),
            title: Text('Manage Reports', style: kDrawerStyle),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, ManageReportScreen.id);
            },
          ),
          kDivider,
          ListTile(
            leading: Icon(Icons.exit_to_app, color: kRedColor),
            title: Text('Exit', style: kDrawerStyle),
            onTap: () {SystemNavigator.pop();},
          ),
          kDivider
        ],
      ),
    );
  }
}
