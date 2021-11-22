import 'package:capstone_apps/common/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const ROUTE_NAME = "/home-page";
  const HomePage({Key? key}) : super(key: key);


  Widget HomePageHeader(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 7,
                blurRadius: 7,
                offset: Offset(0, 0),
              )
            ],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [kDeepGreen, kLightGreen],
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(top: 10),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Fight Covid",
                  style: kHeading5.copyWith(color: kWhite),
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Ayo bersama lawan covid 19",
                  style: kHeading6.copyWith(color: kWhite),
                )),
            Container(
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
              child: ListTile(
                leading: Icon(
                  Icons.location_pin,
                  color: kDeepGreen,
                ),
                title: Text("Indonesia", style: kHeading6,),
              ),
            )
          ],
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            HomePageHeader(context),
            // CovidDataSection(context),
            // HomePageBanner(context),
            // InformationSection(context),
          ],
        ),
      ),
    );
  }
}
