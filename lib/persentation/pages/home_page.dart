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

    Widget CovidDataSection(BuildContext context) {
      Widget DataCovidItem(icon, angka, keterangan, iconColor) {
        return Container(
          width: 110,
          height: 140,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: kDeepGreen,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 7, bottom: 10),
                child: CircleAvatar(
                  backgroundColor: iconColor,
                  child: Icon(icon),
                ),
              ),
              Text(
                angka,
                style: kHeading6,
              ),
              Text(
                keterangan,
                style: kHeading6.copyWith(fontWeight: FontWeight.w600),
              )
            ],
          ),
        );
      }

      return Container(
        margin: EdgeInsets.all(10),
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Update Terkini",
                    style: kSubtitle.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text("12 25 2021")
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DataCovidItem(Icons.add_circle_outline_outlined, "4.000.000", "Positif",
                    Colors.lightBlue.withOpacity(0.5)),
                DataCovidItem(
                    Icons.favorite, "4.000.000", "Sembuh", kLightGreen.withOpacity(0.5)),
                DataCovidItem(
                    Icons.dangerous_outlined, "4.000", "Mati", Colors.red.withOpacity(0.8)),
              ],
            ),
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
            CovidDataSection(context),
            // HomePageBanner(context),
            // InformationSection(context),
          ],
        ),
      ),
    );
  }
}
