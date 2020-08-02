import 'package:flutter/material.dart';
import 'package:epicontrol/screens/HomeScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:epicontrol/constant.dart';
import 'dart:async';

class LoadingScreen extends StatefulWidget {
  static String id = 'loadingScreen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    splashScreen();
  }

  splashScreen() async {
    var duration = Duration(seconds: 8);
    return Timer(duration, navigationScreen);
  }

  void navigationScreen() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kRedColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitDoubleBounce(
              color: kWhiteColor,
              size: 60.0,
            ),
            SizedBox(
              width: 40.0,
            ),
            Text('UControl', style: TextStyle(color: kWhiteColor, fontSize: 18.0, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
