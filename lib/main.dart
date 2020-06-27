import 'package:epicontrol/screens/AnalyseScreen.dart';
import 'package:epicontrol/screens/CollectScreen.dart';
import 'package:epicontrol/screens/DataCollectFormScreen.dart';
import 'package:epicontrol/screens/HomeScreen.dart';
import 'package:epicontrol/screens/LoadingScreen.dart';
import 'package:epicontrol/screens/ManageReportScreen.dart';
import 'package:epicontrol/screens/MapScreen.dart';
import 'package:epicontrol/screens/ReportScreen.dart';
import 'package:flutter/material.dart';
import 'package:epicontrol/constant.dart';

void main() => runApp(EpiControl());

class EpiControl extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Epicontrol App',
      theme: ThemeData(
        primaryColor: kRedColor,
      ),
      initialRoute: LoadingScreen.id,
      routes: {
        LoadingScreen.id: (context) => LoadingScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        CollectScreen.id: (context) => CollectScreen(),
        DataCollectForm.id: (context) => DataCollectForm(),
        AnalyseScreen.id: (context) => AnalyseScreen(),
        ReportScreen.id: (context) => ReportScreen(),
        MapScreen.id: (context) => MapScreen(),
        ManageReportScreen.id: (context) => ManageReportScreen()
      },
    );
  }
}
