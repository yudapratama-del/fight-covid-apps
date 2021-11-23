import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/common/state_enum.dart';
import 'package:capstone_apps/persentation/pages/hospital_detail_page.dart';
import 'package:capstone_apps/persentation/providers/location_notifier.dart';
import 'package:capstone_apps/persentation/widgets/hospital_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HospitaleListPage extends StatefulWidget {
  static const ROUTE_NAME = "/hospital";

  const HospitaleListPage({
    Key? key,
    required this.cityId,
    required this.provinceId,
  }) : super(key: key);

  final String provinceId;
  final String cityId;

  @override
  _HospitaleListPageState createState() => _HospitaleListPageState();
}

class _HospitaleListPageState extends State<HospitaleListPage> {
  @override
  void initState() {
    Future.microtask(
      () => Provider.of<LocationNotifier>(context, listen: false)
          .fetchDataHospital(widget.provinceId, widget.cityId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGreen,
        title: Text("Daftar Rumah Sakit"),
      ),
      body: Consumer<LocationNotifier>(
        builder: (context, data, _) {
          if (data.hospitalState == RequestState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (data.hospitalState == RequestState.Loaded) {
            return ListView.builder(
              itemCount: data.hospital.length,
              itemBuilder: (BuildContext context, int index) {
                return HospitalItem(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      HospitalDetailPage.ROUTE_NAME,
                      arguments: data.hospital[index].id,
                    );
                  },
                  hospital: data.hospital[index],
                );
              },
            );
          } else {
            return Center(
              child: Text(data.msg),
            );
          }
        },
      ),
    );
  }
}
