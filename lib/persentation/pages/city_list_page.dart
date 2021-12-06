import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/common/state_enum.dart';
import 'package:capstone_apps/persentation/pages/hospital_list_page.dart';
import 'package:capstone_apps/persentation/providers/location_notifier.dart';
import 'package:capstone_apps/persentation/widgets/city_item.dart';
import 'package:capstone_apps/persentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityListPage extends StatefulWidget {
  static const ROUTE_NAME = "/city";

  final String provinceId;
  const CityListPage({
    Key? key,
    required this.provinceId,
  }) : super(key: key);

  static List dataTest = [1];

  @override
  _CityListPageState createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    Future.microtask(
      () => Provider.of<LocationNotifier>(context, listen: false)
          .fetchDataCity(widget.provinceId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Kota"),
        backgroundColor: kLightGreen,
      ),
      body: Column(
        children: [
          TextFieldWidget(
            controller: editingController,
            onChange: () {
              setState(() {});
            },
          ),
          Consumer<LocationNotifier>(
            builder: (context, data, _) {
              if (data.cityState == RequestState.Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.cityState == RequestState.Loaded) {
                return Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: data.city.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (editingController.text.isEmpty) {
                        return CityItem(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              HospitaleListPage.ROUTE_NAME,
                              arguments: {
                                "provinceId": widget.provinceId,
                                "cityId": data.city[index].id,
                              },
                            );
                          },
                          city: data.city[index],
                          index: index,
                        );
                      } else if (data.city[index].name
                          .toLowerCase()
                          .contains(editingController.text)) {
                        return CityItem(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              HospitaleListPage.ROUTE_NAME,
                              arguments: {
                                "provinceId": widget.provinceId,
                                "cityId": data.city[index].id,
                              },
                            );
                          },
                          city: data.city[index],
                          index: index,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                );
              } else {
                return Center(
                  child: Text(data.msg),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
