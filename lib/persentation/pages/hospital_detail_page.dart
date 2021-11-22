import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/persentation/widgets/hospital_room_item.dart';
import 'package:flutter/material.dart';

class HospitalDetailPage extends StatelessWidget {
  const HospitalDetailPage({Key? key}) : super(key: key);

  static List dataTest = [1, 1, 1, 1, 1, 1];

  Widget Header(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 7,
              blurRadius: 7,
              offset: Offset(0, 0),
            )
          ],
          borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [kDeepGreen, kLightGreen],
          )),
      height: 250,
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/hospital_illustration.png"))),
          Container(
            child: Text(
              "Nama",
              style: kHeading5.copyWith(color: kWhite),
            ),
          ),
          Container(
            child: Text(
              "Alamat",
              style: kHeading6.copyWith(color: kWhite),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              "Tlpn",
              style: kSubtitle.copyWith(color: kWhite),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: kWhite, onPrimary: kDeepGreen),
            child: Text("Go To Gmaps", style: kBodyText),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget RoomList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: dataTest.length,
          itemBuilder: (BuildContext context, int index) {
            return HospitalRoomItem();
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(context), 
              RoomList(context)
              ],
          ),
        ),
      ),
    );
  }
}
