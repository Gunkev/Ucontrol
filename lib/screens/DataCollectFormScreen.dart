import 'package:epicontrol/screens/ManageReportScreen.dart';
import 'package:flutter/material.dart';
import 'package:epicontrol/constant.dart';
import 'package:epicontrol/component/AppBarWidget.dart';
import 'package:epicontrol/component/ReusableButtons.dart';
import 'package:epicontrol/component/MenuDrawer.dart';
import 'package:epicontrol/models/Reports.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audio_cache.dart';



class DataCollectForm extends StatefulWidget {
  static String id = 'dataCollectForm';

  @override
  _DataCollectFormState createState() => _DataCollectFormState();
}

class _DataCollectFormState extends State<DataCollectForm> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _reporter, _email, _alertType, _regionAffected, _countryAffected, _description;
  SharedPreferences sharedPreferences;
  Reports reportSave = Reports();
  final AudioCache checkFormSound = AudioCache();
  List<Reports> reports = [];


  @override
  void initState() {
    initSharedPreferences();
    super.initState();
  }

  void initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        reportSave.email = _email;
        reportSave.reporter = _reporter;
        reportSave.alertType = _alertType;
        reportSave.regionAffected = _regionAffected;
        reportSave.countryAffected = _countryAffected;
        reportSave.description = _description;
      });
    } else {
      print('invalid form');
    }
  }

  void addReport(Reports report) {
    _submit();
    reports.add(report);
    saveData();
  }

  void saveData() async {
    List<String> reportList = reports.map((report) => json.encode(report.toJson())).toList();
    await sharedPreferences.setStringList('reports', reportList);
    print('report: $reportList');
  }

  void loadData() {
    List<String> reportList = sharedPreferences.getStringList('reports');
    reports = reportList.map((report) => Reports.fromJson(json.decode(report))).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBarWidget(title: 'Collect')
      ),
      drawer: MenuDrawer(),
      body: SafeArea(
        child: Container(
          color: kWhiteColor,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: kMediumHorizontalSpace),
                      Text(
                          'Please fill the form below to help us collect informations'),
                      SizedBox(height: kMediumHorizontalSpace),
                      Container(
                        child: TextFormField(
                            onSaved: (val) => _reporter = val,
                            onChanged: (text) {
                              _reporter = text;
                            },
                            validator: (val) =>
                            val.length < 6
                                ? 'Name too short'
                                : null,
                            autocorrect: true,
                            decoration: kTextFieldAuthDecoration.copyWith(
                                hintText: 'Reporter\'s name',
                                prefixIcon: Icon(
                                  Icons.person, color: kPinkColor,))
                        ),
                      ),
                      SizedBox(height: kMediumHorizontalSpace),
                      Container(
                        child: TextFormField(
                            onSaved: (val) => _email = val,
                            onChanged: (text) {
                              _email = text;
                            },
                            validator: (val) =>
                            val.contains('@')
                                ? null
                                : 'Invalid email',
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: true,
                            decoration: kTextFieldAuthDecoration.copyWith(
                                hintText: 'Email',
                                prefixIcon: Icon(
                                    Icons.email, color: kPinkColor))
                        ),
                      ),
                      SizedBox(height: kMediumHorizontalSpace),
                      Container(
                        child: TextFormField(
                            onSaved: (val) => _alertType = val,
                            onChanged: (text) {
                              _alertType = text;
                            },
                            validator: (val) =>
                            val.isEmpty
                                ? 'please provide information'
                                : null,
                            autocorrect: true,
                            decoration: kTextFieldAuthDecoration.copyWith(
                                hintText: 'Alert type',
                                prefixIcon: Icon(
                                  Icons.blur_circular, color: kPinkColor,))
                        ),
                      ),
                      SizedBox(height: kMediumHorizontalSpace),
                      Container(
                        child: TextFormField(
                            onSaved: (val) => _regionAffected = val,
                            onChanged: (text) {
                              _regionAffected = text;
                            },
                            validator: (val) =>
                            val.isEmpty
                                ? 'please provide information'
                                : null,
                            autocorrect: true,
                            decoration: kTextFieldAuthDecoration.copyWith(
                                hintText: 'Region affected',
                                prefixIcon: Icon(
                                  Icons.donut_small, color: kPinkColor,))
                        ),
                      ),
                      SizedBox(height: kMediumHorizontalSpace),
                      Container(
                        child: TextFormField(
                            onSaved: (val) => _countryAffected = val,
                            onChanged: (text) {
                              _countryAffected = text;
                            },
                            validator: (val) =>
                            val.isEmpty
                                ? 'please provide information'
                                : null,
                            autocorrect: true,
                            decoration: kTextFieldAuthDecoration.copyWith(
                                hintText: 'Country',
                                prefixIcon: Icon(
                                  Icons.flag, color: kPinkColor,))
                        ),
                      ),
                      SizedBox(height: kMediumHorizontalSpace),
                      Container(
                        child: TextFormField(
                            onSaved: (val) => _description = val,
                            onChanged: (text) {
                              _description = text;
                            },
                            validator: (val) =>
                            val.isEmpty
                                ? 'please provide description'
                                : null,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            autocorrect: true,
                            decoration: kTextFieldAuthDecoration.copyWith(
                                hintText: 'Description of illness. Ex: Signs symtoms and behavior of affected individual',
                                prefixIcon: Icon(
                                    Icons.comment, color: kPinkColor))
                        ),
                      ),
                      SizedBox(height: kBigHorizontalSpace),
                      ReusableButton(
                        onPress: () {
                          final form = _formKey.currentState;
                          if (form.validate()) {
                            addReport(Reports(
                                reporter: _reporter,
                                email: _email,
                                alertType: _alertType,
                                countryAffected: _countryAffected,
                                regionAffected: _regionAffected,
                                description: _description
                            ));
                            checkFormSound.play('soundsilk-Correct-Answer-Soundeffect.mp3');
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ManageReportScreen(reports: reports)));
                          } else {
                            checkFormSound.play('soundsilk-buzzer-wrong-answer.mp3');
                          }
                        },
                        padding: EdgeInsets.all(15.0),
                        text: 'save',
                        colour: kPinkColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




