import 'package:capstone_apps/common/constants.dart';
import 'package:flutter/material.dart';

class HospitalRoomItem extends StatelessWidget {
  const HospitalRoomItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kLightGreen,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 7,
              blurRadius: 7,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius:
              BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [kDeepGreen, kLightGreen],
                  )),
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Text(
                "Nama Ruangan",
                textAlign: TextAlign.center,
                style: kHeading6.copyWith(color: kWhite),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Tersedia"),
                    Text(
                      "12",
                      style: kHeading6.copyWith(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text("Kosong"),
                    Text(
                      "12",
                      style: kHeading6.copyWith(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text("Antrian"),
                    Text(
                      "0",
                      style: kHeading6.copyWith(fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
