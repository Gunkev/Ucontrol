import 'package:flutter/material.dart';
import 'package:epicontrol/models/Reports.dart';

class CardInfo extends StatelessWidget {

  CardInfo({this.report});
  final Reports report;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Reporter: " + (report.reporter ?? "").toUpperCase(),
                style: TextStyle(fontSize: 16)),
            Text("Email: " + (report.email ?? ""),
                style: TextStyle(fontSize: 16)),
            Text("Alert Type: " + (report.alertType ?? ""),
                style: TextStyle(fontSize: 16)),
            Text("Country: " + (report.countryAffected ?? "").toUpperCase(),
                style: TextStyle(fontSize: 16)),
            Text("Region: " + (report.regionAffected ?? "").toUpperCase(),
                style: TextStyle(fontSize: 16)),
            Text("Description: " + (report.description ?? ""),
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
