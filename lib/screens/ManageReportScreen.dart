import 'package:flutter/material.dart';
import 'package:epicontrol/component/AppBarWidget.dart';
import 'package:epicontrol/component/MenuDrawer.dart';
import 'package:epicontrol/models/Reports.dart';
import 'package:epicontrol/component/CardInfo.dart';
import 'package:epicontrol/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class ManageReportScreen extends StatelessWidget {
  ManageReportScreen({this.reports});
  final List<Reports> reports;
  SharedPreferences sharedPreferences;

  static String id = 'manageReportScreen';

  void initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveData() async {
    List<String> reportList = reports.map((report) => json.encode(report.toJson())).toList();
    await sharedPreferences.setStringList('reports', reportList);
    print('report: $reportList');
  }

  @override
  Widget build(BuildContext context) {
    initSharedPreferences();
    saveData();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBarWidget(title: 'Reports')
      ),
      drawer: MenuDrawer(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
              itemCount: reports.length,
              itemBuilder: (BuildContext context, int index) {
                final report = reports[index];
                return CardInfo(report: report);
              },
            ),
          ),
        ),
    );
  }
}
