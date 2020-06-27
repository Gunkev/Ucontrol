import 'package:flutter/material.dart';
import 'package:epicontrol/component/AppBarWidget.dart';
import 'package:epicontrol/component/MenuDrawer.dart';

class ManageReportScreen extends StatefulWidget {
  static String id = 'manageReport';

  @override
  _ManageReportScreenState createState() => _ManageReportScreenState();
}

class _ManageReportScreenState extends State<ManageReportScreen> {
  static String id = 'manageReport';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBarWidget(title: 'Manage reports')
      ),
      drawer: MenuDrawer(),
    );
  }
}
