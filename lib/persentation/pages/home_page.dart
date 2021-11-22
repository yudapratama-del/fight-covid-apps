import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/common/state_enum.dart';
import 'package:capstone_apps/persentation/pages/province_list_page.dart';
import 'package:capstone_apps/persentation/providers/covid_notifier.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = "/home-page";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    Future.microtask(
      () => Provider.of<CovidNotifier>(context, listen: false)
          .fetchUpdateDataCovid(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          getData();
        },
        child: Container(
          child: ListView(
            children: [
              HomePageHeader(context),
              CovidDataSection(context),
              HomePageBanner(context),
              InformationSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget HomePageHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
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
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [kDeepGreen, kLightGreen],
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(top: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Fight Covid",
                style: kHeading5.copyWith(color: kWhite),
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Ayo bersama lawan covid 19",
                style: kHeading6.copyWith(color: kWhite),
              )),
          Container(
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
            child: ListTile(
              leading: Icon(
                Icons.location_pin,
                color: kDeepGreen,
              ),
              title: Text(
                "Indonesia",
                style: kHeading6,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget CovidDataSection(BuildContext context) {
    Widget DataCovidItem(icon, angka, keterangan, iconColor) {
      return Container(
        width: 110,
        height: 140,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kDeepGreen,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 7, bottom: 10),
              child: CircleAvatar(
                backgroundColor: iconColor,
                child: Icon(icon),
              ),
            ),
            Text(
              angka,
              style: kHeading6,
            ),
            Text(
              keterangan,
              style: kHeading6.copyWith(fontWeight: FontWeight.w600),
            )
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.all(10),
      height: 180,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Update Terkini",
                  style: kSubtitle.copyWith(fontWeight: FontWeight.w600),
                ),
                Consumer<CovidNotifier>(
                  builder: (context, data, _) {
                    if (data.updateDataCovidState == RequestState.Loading) {
                      return Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (data.updateDataCovidState ==
                        RequestState.Loaded) {
                      return Text(
                        DateFormat.yMMMEd().format(
                          data.updateDataCovid!.penambahan.tanggal,
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(data.msg!),
                      );
                    }
                  },
                )
              ],
            ),
          ),
          Consumer<CovidNotifier>(
            builder: (context, data, _) {
              if (data.updateDataCovidState == RequestState.Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.updateDataCovidState == RequestState.Loaded) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DataCovidItem(
                      Icons.add_circle_outline_outlined,
                      NumberFormat.currency(
                        locale: 'id_ID',
                        decimalDigits: 0,
                        symbol: '',
                      ).format(data.updateDataCovid!.total.jumlahPositif),
                      "Positif",
                      Colors.lightBlue.withOpacity(0.5),
                    ),
                    DataCovidItem(
                      Icons.favorite,
                      NumberFormat.currency(
                        locale: 'id_ID',
                        decimalDigits: 0,
                        symbol: '',
                      ).format(data.updateDataCovid!.total.jumlahSembuh),
                      "Sembuh",
                      kLightGreen.withOpacity(0.5),
                    ),
                    DataCovidItem(
                      Icons.dangerous_outlined,
                      NumberFormat.currency(
                        locale: 'id_ID',
                        decimalDigits: 0,
                        symbol: '',
                      ).format(data.updateDataCovid!.total.jumlahMeninggal),
                      "Mati",
                      Colors.red.withOpacity(0.8),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text(data.msg!),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget HomePageBanner(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 7,
            blurRadius: 7,
            offset: Offset(0, 2),
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [kDeepGreen, kLightGreen],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset("assets/images/banner_image.png"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fight Covid 19",
                style: kHeading6.copyWith(
                    fontWeight: FontWeight.w600, color: kWhite),
              ),
              Text(
                "Lawan Covid 19 Bersama",
                style: kBodyText.copyWith(color: kWhite),
              ),
              Text(
                "#FightCovid19",
                style: kBodyText.copyWith(color: kWhite),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget InformationSection(BuildContext context) {
    Widget InformarionListItem(
        String text, String subtitle, String image, Function onTap) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 7),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kLightGreen,
            width: 1,
          ),
        ),
        child: InkWell(
          child: ListTile(
            leading:
                CircleAvatar(radius: 20, backgroundImage: AssetImage(image)),
            trailing: Icon(Icons.keyboard_arrow_right_rounded),
            title: Text(
              text,
              style: kSubtitle,
            ),
            subtitle: Text(
              subtitle,
              style: kBodyText,
            ),
          ),
          onTap: () {
            onTap();
          },
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "Information List",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            )),
        InformarionListItem(
          "Rumah Sakit Rujukan Covid",
          "lihat daftar rumah sakit rujukan di kotamu",
          "assets/images/hospital_illustration.png",
          () {
            Navigator.pushNamed(context, ProvinceListPage.ROUTE_NAME);
          },
        ),
        InformarionListItem(
          "Berita Kesehatan Indonesia",
          "lihat berita kesehatan di Indonesia",
          "assets/images/news_illustration.png",
          () {},
        ),
      ],
    );
  }
}
