import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/domain/entities/hospital.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HospitalItem extends StatefulWidget {
  final Function onTap;
  final Hospital hospital;
  final int index;

  const HospitalItem({
    Key? key,
    required this.onTap,
    required this.hospital,
    required this.index,
  }) : super(key: key);

  @override
  _HospitalItemState createState() => _HospitalItemState();
}

class _HospitalItemState extends State<HospitalItem> {
  bool _animate = false;
  static bool _isStart = true;

  @override
  void initState() {
    super.initState();
    _isStart
        ? Future.delayed(Duration(milliseconds: widget.index * 100), () {
            setState(() {
              _animate = true;
              _isStart = false;
            });
          })
        : _animate = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 1000),
        opacity: _animate ? 1 : 0,
        curve: Curves.easeInOutQuart,
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
                      widget.hospital.name!,
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
      ),
      onTap: () {
        widget.onTap();
      },
    );
  }
}
