import 'package:capstone_apps/common/constants.dart';
import 'package:flutter/material.dart';

Widget emptyDataAlert(String alertText) {
  return Container(
    margin: EdgeInsets.only(top: 90),
      child: Center(
          child: Column(children: [
    Image.asset(
      "assets/images/data_not_found_illustration.png",
      width: 290,
    ),
    SizedBox(
      height: 5,
    ),
    Text(alertText, textAlign: TextAlign.center, style: kHeading4)
  ])));
}
