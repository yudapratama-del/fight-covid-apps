import 'package:capstone_apps/persentation/widgets/hospital_item.dart';
import 'package:flutter/material.dart';

class HospitaleListPage extends StatelessWidget {
  static const ROUTE_NAME = "/hospital";
  const HospitaleListPage({Key? key}) : super(key: key);

  static List dataTest = [1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Rumah Sakit"),
      ),
      body: ListView.builder(
        itemCount: dataTest.length,
        itemBuilder: (BuildContext context, int index) {
          return HospitalItem();
        },
      ),
    );
  }
}
