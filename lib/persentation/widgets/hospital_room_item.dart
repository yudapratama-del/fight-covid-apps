import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/data/models/hospital_detail_model.dart';
import 'package:flutter/material.dart';

class HospitalRoomItem extends StatefulWidget {
  const HospitalRoomItem({
    Key? key,
    required this.bedDetail,
    required this.index,
  }) : super(key: key);

  final BedDetail bedDetail;
  final int index;

  @override
  _HospitalRoomItemState createState() => _HospitalRoomItemState();
}

class _HospitalRoomItemState extends State<HospitalRoomItem> {
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
    return AnimatedOpacity(
      duration: Duration(milliseconds: 1000),
      opacity: _animate ? 1 : 0,
      curve: Curves.easeInOutQuart,
      child: Container(
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
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [kDeepGreen, kLightGreen],
                    )),
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Text(
                  widget.bedDetail.stats.title,
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
                        widget.bedDetail.stats.bedAvailable.toString(),
                        style: kHeading6.copyWith(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("Kosong"),
                      Text(
                        widget.bedDetail.stats.bedEmpty.toString(),
                        style: kHeading6.copyWith(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("Antrian"),
                      Text(
                        widget.bedDetail.stats.queue.toString(),
                        style: kHeading6.copyWith(fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
