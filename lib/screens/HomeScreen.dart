import 'package:epicontrol/constant.dart';
import 'package:epicontrol/screens/AnalyseScreen.dart';
import 'package:epicontrol/screens/CollectScreen.dart';
import 'package:epicontrol/screens/MapScreen.dart';
import 'package:epicontrol/screens/ReportScreen.dart';
import 'package:epicontrol/screens/ManageReportScreen.dart';
import 'package:flutter/material.dart';
import 'package:epicontrol/component/AppBarWidget.dart';
import 'package:epicontrol/component/Cards.dart';
import 'package:epicontrol/component/MenuDrawer.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBarWidget(title: 'EpiControl')
      ),
      drawer: MenuDrawer(),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: MediaQuery.of(context).size.height / 200,
          crossAxisSpacing: 5.0,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
          mainAxisSpacing: 5.0,
          children: <Widget>[
            Cards(
              text: 'Collect',
              icon: Icons.grain,
              color: kBlueColor,
              onTap: () {Navigator.pushNamed(context, CollectScreen.id);},
            ),
            Cards(
              text: 'Analyse',
              icon: Icons.show_chart,
              color: kGreenColor,
              onTap: () {Navigator.pushNamed(context, AnalyseScreen.id);},
            ),
            Cards(
              text: 'Report an Outbreak',
              icon: Icons.add_comment,
              color: kRedColor,
              onTap: () {Navigator.pushNamed(context, ReportScreen.id);},
            ),
            Cards(
              text: 'Maps',
              icon: Icons.map,
              color: kOrangeColor,
              onTap: () {Navigator.pushNamed(context, MapScreen.id);},
            ),
            Cards(
              text: 'Manage Reports',
              icon: Icons.announcement,
              color: kPinkColor,
              onTap: () {Navigator.pushNamed(context, ManageReportScreen.id);},
            ),
          ],
        ),
      )
    );
  }
}



