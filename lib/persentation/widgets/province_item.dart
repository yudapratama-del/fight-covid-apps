import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/domain/entities/province.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProvinceItem extends StatelessWidget {
  final Function onTap;
  final Province province;
  const ProvinceItem({
    Key? key,
    required this.onTap,
    required this.province,
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
                "assets/images/place_illustration.png",
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Provinsi"),
                Text(
                  province.name,
                  style: kHeading6.copyWith(fontWeight: FontWeight.w600),
                )
              ],
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
