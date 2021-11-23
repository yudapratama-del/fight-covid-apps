import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/domain/entities/hospital.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HospitalItem extends StatelessWidget {
  final Function onTap;
  final Hospital hospital;

  const HospitalItem({
    Key? key,
    required this.onTap,
    required this.hospital,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kLightGreen,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(
                "assets/images/hospital_illustration.png",
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rumah Sakit"),
                  Text(
                    hospital.name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kHeading6.copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
