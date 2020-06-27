import 'package:epicontrol/constant.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w900)),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.more_vert, color: kWhiteColor),
          onPressed: () {},
        )
      ],
    );
  }
}