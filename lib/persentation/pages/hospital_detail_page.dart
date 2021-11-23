import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/common/state_enum.dart';
import 'package:capstone_apps/persentation/providers/location_notifier.dart';
import 'package:capstone_apps/persentation/widgets/hospital_room_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalDetailPage extends StatefulWidget {
  static const ROUTE_NAME = "detail-hospital";

  const HospitalDetailPage({
    Key? key,
    required this.hospitalId,
  }) : super(key: key);

  final String hospitalId;

  @override
  _HospitalDetailPageState createState() => _HospitalDetailPageState();
}

class _HospitalDetailPageState extends State<HospitalDetailPage> {
  @override
  void initState() {
    Future.microtask(() => Provider.of<LocationNotifier>(context, listen: false)
        .fetchDetailHospital(widget.hospitalId));
    super.initState();
  }

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      print("Error");
    }
  }

  Future<void> showConfirmation(String mapUrl) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfimasi"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Apakah kamu ingin pergi ke Rumah Sakit ini?"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                launchUrl(mapUrl);
              },
              child: Text("Go!"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreen,
      body: SafeArea(
        child: Container(
          color: kWhite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(context),
              RoomList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget Header(BuildContext context) {
    return Consumer<LocationNotifier>(
      builder: (context, data, _) {
        if (data.hospitalDetailState == RequestState.Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (data.hospitalDetailState == RequestState.Loaded) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: margin,
              vertical: 10,
            ),
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
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [kDeepGreen, kLightGreen],
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      "assets/images/hospital_illustration.png",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    data.hospitalDetail.name,
                    textAlign: TextAlign.center,
                    style: kHeading5.copyWith(color: kWhite),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Text(
                    data.hospitalDetail.address,
                    textAlign: TextAlign.center,
                    style: kHeading6.copyWith(
                      color: kWhite,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Text(
                    data.hospitalDetail.phone,
                    style: kSubtitle.copyWith(color: kWhite),
                  ),
                ),
                Consumer<LocationNotifier>(
                  builder: (context, data, _) {
                    if (data.hospitalMapState == RequestState.Loading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (data.hospitalMapState == RequestState.Loaded) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kWhite,
                          onPrimary: kDeepGreen,
                        ),
                        child: Text(
                          "Go To Maps",
                          style: kBodyText,
                        ),
                        onPressed: () {
                          showConfirmation(data.hospitalMap.gmaps);
                          print(data.hospitalMap.gmaps);
                        },
                      );
                    } else {
                      return Center(
                        child: Text(data.msg),
                      );
                    }
                  },
                )
              ],
            ),
          );
        } else {
          return Center(
            child: Text(data.msg),
          );
        }
      },
    );
  }

  Widget RoomList(BuildContext context) {
    return Consumer<LocationNotifier>(
      builder: (context, data, _) {
        if (data.hospitalDetailState == RequestState.Loaded) {
          return Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: data.hospitalDetail.bedDetail.length,
              itemBuilder: (BuildContext context, int index) {
                return HospitalRoomItem(
                  bedDetail: data.hospitalDetail.bedDetail[index],
                  index: index,
                );
              },
            ),
          );
        } else {
          return Center(
            child: Text(data.msg),
          );
        }
      },
    );
  }
}
