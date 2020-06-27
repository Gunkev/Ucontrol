import 'package:flutter/material.dart';
import 'package:epicontrol/component/AppBarWidget.dart';
import 'package:epicontrol/constant.dart';
import 'package:epicontrol/component/ReusableButtons.dart';
import 'package:epicontrol/component/MenuDrawer.dart';

class ReportScreen extends StatefulWidget {
  static String id = 'reportScreen';

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBarWidget(title: 'Report')
      ),
      drawer: MenuDrawer(),
      body: SafeArea(
        child: Container(
          color: kWhiteColor,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: kMediumHorizontalSpace),
                    Text('Please provide any information susceptible to help control epidemics'),
                    SizedBox(height: kMediumHorizontalSpace),
                    Container(
                      child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: true,
                          decoration: kTextFieldAuthDecoration.copyWith(hintText: 'Email', prefixIcon: Icon(Icons.email, color: kPinkColor))
                      ),
                    ),
                    SizedBox(height: kMediumHorizontalSpace),
                    Container(
                      child: TextField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          autocorrect: true,
                          decoration: kTextFieldAuthDecoration.copyWith(hintText: 'Message', prefixIcon: Icon(Icons.comment, color: kPinkColor))
                      ),
                    ),
                    SizedBox(height: kBigHorizontalSpace),
                    ReusableButton(
                      onPress: () {},
                      padding: EdgeInsets.all(15.0),
                      text: 'Submit',
                      colour: kPinkColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
