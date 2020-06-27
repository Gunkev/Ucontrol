import 'package:flutter/material.dart';
import 'package:epicontrol/constant.dart';
import 'package:epicontrol/component/AppBarWidget.dart';
import 'package:epicontrol/component/ReusableButtons.dart';
import 'package:epicontrol/component/MenuDrawer.dart';

class DataCollectForm extends StatefulWidget {
  static String id = 'dataCollectForm';

  @override
  _DataCollectFormState createState() => _DataCollectFormState();
}

class _DataCollectFormState extends State<DataCollectForm> {
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
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: kMediumHorizontalSpace),
                    Text('Please fill the form below to help us collect informations'),
                    SizedBox(height: kMediumHorizontalSpace),
                    Container(
                      child: TextField(
                          autocorrect: true,
                          decoration: kTextFieldAuthDecoration.copyWith(hintText: 'Reporter\'s name', prefixIcon: Icon(Icons.person, color: kPinkColor,))
                      ),
                    ),
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
                          autocorrect: true,
                          decoration: kTextFieldAuthDecoration.copyWith(hintText: 'Region', prefixIcon: Icon(Icons.donut_small, color: kPinkColor,))
                      ),
                    ),
                    SizedBox(height: kMediumHorizontalSpace),
                    Container(
                      child: TextField(
                          autocorrect: true,
                          decoration: kTextFieldAuthDecoration.copyWith(hintText: 'Country', prefixIcon: Icon(Icons.flag, color: kPinkColor,))
                      ),
                    ),
                    SizedBox(height: kMediumHorizontalSpace),
                    Container(
                      child: TextField(
                          autocorrect: true,
                          decoration: kTextFieldAuthDecoration.copyWith(hintText: 'Susciptible illness name', prefixIcon: Icon(Icons.blur_circular, color: kPinkColor,))
                      ),
                    ),
                    SizedBox(height: kMediumHorizontalSpace),
                    Container(
                      child: TextField(
                          autocorrect: true,
                          decoration: kTextFieldAuthDecoration.copyWith(hintText: 'Region affected', prefixIcon: Icon(Icons.donut_small, color: kPinkColor,))
                      ),
                    ),
                    SizedBox(height: kMediumHorizontalSpace),
                    Container(
                      child: TextField(
                          autocorrect: true,
                          decoration: kTextFieldAuthDecoration.copyWith(hintText: 'Country', prefixIcon: Icon(Icons.flag, color: kPinkColor,))
                      ),
                    ),
                    SizedBox(height: kMediumHorizontalSpace),
                    Container(
                      child: TextField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          autocorrect: true,
                          decoration: kTextFieldAuthDecoration.copyWith(hintText: 'Description of illness. Ex: Signs symtoms and behavior of affected individual', prefixIcon: Icon(Icons.comment, color: kPinkColor))
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
