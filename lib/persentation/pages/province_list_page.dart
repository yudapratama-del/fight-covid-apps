import 'package:capstone_apps/persentation/widgets/province_item.dart';
import 'package:flutter/material.dart';

class ProvinceListPage extends StatelessWidget {
  const ProvinceListPage({Key? key}) : super(key: key);

  /// data bo'ongan
  static List dataTest = [1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Provinsi"),),
      body: ListView.builder(
          itemCount: dataTest.length,
          itemBuilder: (BuildContext context, int index) {
            return ProvinceItem();
          }),
    );
  }
}
