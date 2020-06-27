import 'package:epicontrol/constant.dart';
import 'package:epicontrol/screens/AnalyseScreen.dart';
import 'package:epicontrol/screens/CollectScreen.dart';
import 'package:epicontrol/screens/ManageReportScreen.dart';
import 'package:epicontrol/screens/MapScreen.dart';
import 'package:epicontrol/screens/ReportScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuDrawer extends StatefulWidget {
  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
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
            child: Text('EpiControl',style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25.0, color: kWhiteColor)),
          ),
          ListTile(
            leading: Icon(Icons.grain, color: kRedColor),
            title: Text('Collect', style: kDrawerStyle),
            onTap: () {Navigator.pushNamed(context, CollectScreen.id);},
          ),
          kDivider,
          ListTile(
            leading: Icon(Icons.show_chart, color: kRedColor),
            title: Text('Analyse', style: kDrawerStyle),
            onTap: () {Navigator.pushNamed(context, AnalyseScreen.id);},
          ),
          kDivider,
          ListTile(
            leading: Icon(Icons.add_comment, color: kRedColor),
            title: Text('Report an Outbreak', style: kDrawerStyle),
            onTap: () {Navigator.pushNamed(context, ReportScreen.id);},
          ),
          kDivider,
          ListTile(
            leading: Icon(Icons.map, color: kRedColor),
            title: Text('Map', style: kDrawerStyle),
            onTap: () {Navigator.pushNamed(context, MapScreen.id);},
          ),
          kDivider,
          ListTile(
            leading: Icon(Icons.announcement, color: kRedColor),
            title: Text('Manage Reports', style: kDrawerStyle),
            onTap: () {Navigator.pushNamed(context, ManageReportScreen.id);},
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
