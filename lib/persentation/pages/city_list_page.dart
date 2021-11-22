import 'package:capstone_apps/persentation/widgets/city_item.dart';
import 'package:flutter/material.dart';

class CityListPage extends StatelessWidget {
  const CityListPage({Key? key}) : super(key: key);

  static List dataTest = [1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Kota"),
      ),
      body: ListView.builder(
          itemCount: dataTest.length,
          itemBuilder: (BuildContext context, int index) {
            return CityItem();
          }),
    );
  }
}
