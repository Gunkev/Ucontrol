import 'package:flutter/material.dart';

const kWhiteColor = Colors.white;
const kRedColor = Colors.redAccent;
const kHomeTextStyle = TextStyle(color: kWhiteColor, fontSize: 16.0, fontWeight: FontWeight.w500);
const kCardTextStyle = TextStyle(color: kRedColor, fontSize: 18.0, fontWeight: FontWeight.w500);
const kBlueColor = Colors.blue;
const kGreenColor = Colors.green;
const kPinkColor = Colors.pink;
const kOrangeColor = Colors.orange;
const kTextFieldAuthDecoration = InputDecoration(
    hintText: 'enter something',
    hintStyle: TextStyle(color: kPinkColor),
    prefixIcon: Icon(Icons.email, color: kPinkColor,),
    contentPadding: EdgeInsets.all(16),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kPinkColor, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(6.0))
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPinkColor),
    )
);
const kMediumHorizontalSpace = 15.0;
const kBigHorizontalSpace = 30.0;
const kDrawerStyle = TextStyle(color: kRedColor, fontWeight: FontWeight.w800);
const kDividerColor = Color(0x55ff5252);
const kDivider = Divider(height: 5, color: kDividerColor);