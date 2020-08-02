import 'package:flutter/material.dart';
import 'package:epicontrol/constant.dart';

class Cards extends StatelessWidget {
  const Cards({this.icon, this.text, this.color,this.onTap});
  final IconData icon;
  final text;
  final Color color;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3.0,
        color: color,
        child: Container(
          padding: EdgeInsets.only(left: 15.0),
          child: Row(
            children: <Widget>[
              Icon(icon, size: 30.0, color: kWhiteColor,),
              SizedBox(width: 10.0),
              Text(text, style: kHomeTextStyle)
            ],
          ),
        ),
      ),
    );
  }
}