import 'package:epicontrol/actions/UploadFile.dart';
import 'package:flutter/material.dart';
import 'package:epicontrol/component/AppBarWidget.dart';
import 'package:epicontrol/component/MenuDrawer.dart';
import 'package:epicontrol/constant.dart';
import 'dart:io';

UploadFile uploadFile = UploadFile();


class AnalyseScreen extends StatefulWidget {
  static String id = 'analyseScreen';


  @override
  _AnalyseScreenState createState() => _AnalyseScreenState();
}

class _AnalyseScreenState extends State<AnalyseScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBarWidget(title: 'Analyse')
      ),
      drawer: MenuDrawer(),
      body: Container(
        height: 400,
        child: uploadFile.imageList.length == 0 ?
        Text('no image seleted',style: TextStyle(color: kGreenColor)) :
        GridView.count(
            crossAxisCount: 3,
            shrinkWrap: false,
            primary: false,
            children: uploadFile.imageList.map((File file) {
              return Card(
                child: Image.file(
                  file,
                  fit: BoxFit.cover,
                ),
              );
            }).toList()
        ),
      ),
    );
  }
}
