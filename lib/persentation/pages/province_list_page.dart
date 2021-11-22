import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/common/state_enum.dart';
import 'package:capstone_apps/persentation/pages/city_list_page.dart';
import 'package:capstone_apps/persentation/providers/location_notifier.dart';
import 'package:capstone_apps/persentation/widgets/province_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProvinceListPage extends StatefulWidget {
  static const ROUTE_NAME = "/province";
  const ProvinceListPage({Key? key}) : super(key: key);

  @override
  _ProvinceListPageState createState() => _ProvinceListPageState();
}

class _ProvinceListPageState extends State<ProvinceListPage> {
  @override
  void initState() {
    Future.microtask(
      () => Provider.of<LocationNotifier>(context, listen: false)
          .fetchDataProvince(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Provinsi"),
        backgroundColor: kLightGreen,
      ),
      body: Consumer<LocationNotifier>(
        builder: (context, data, _) {
          if (data.provinceState == RequestState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (data.provinceState == RequestState.Loaded) {
            return ListView.builder(
              itemCount: data.province.length,
              itemBuilder: (BuildContext context, int index) {
                return ProvinceItem(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CityListPage.ROUTE_NAME,
                      arguments: data.province[index].id,
                    );
                  },
                  province: data.province[index],
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
