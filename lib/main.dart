import 'package:capstone_apps/domain/entities/articles.dart';
import 'package:capstone_apps/injection.dart' as getIt;
import 'package:capstone_apps/persentation/pages/bookmark_page.dart';
import 'package:capstone_apps/persentation/pages/city_list_page.dart';
import 'package:capstone_apps/persentation/pages/home_page.dart';
import 'package:capstone_apps/persentation/pages/hospital_detail_page.dart';
import 'package:capstone_apps/persentation/pages/hospital_list_page.dart';
import 'package:capstone_apps/persentation/pages/login_page.dart';
import 'package:capstone_apps/persentation/pages/main_page.dart';
import 'package:capstone_apps/persentation/pages/news_detail_page.dart';
import 'package:capstone_apps/persentation/pages/news_list_page.dart';
import 'package:capstone_apps/persentation/pages/profile_page.dart';
import 'package:capstone_apps/persentation/pages/province_list_page.dart';
import 'package:capstone_apps/persentation/pages/register_page.dart';
import 'package:capstone_apps/persentation/providers/botttom_navbar_notifer.dart';
import 'package:capstone_apps/persentation/providers/covid_notifier.dart';
import 'package:capstone_apps/persentation/providers/location_notifier.dart';
import 'package:capstone_apps/persentation/providers/news_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
  getIt.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavBarNotifier()),
        ChangeNotifierProvider(
          create: (_) => NewsNotifier(
            getNews: getIt.getIt(),
            saveBookmark: getIt.getIt(),
            getBookmark: getIt.getIt(),
            getBookmarkStatus: getIt.getIt(),
            removeBookmark: getIt.getIt(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => CovidNotifier(getDataCovid: getIt.getIt()),
        ),
        ChangeNotifierProvider(
          create: (_) => LocationNotifier(
            getProvince: getIt.getIt(),
            getCity: getIt.getIt(),
            getHospital: getIt.getIt(),
            getDetailHospital: getIt.getIt(),
            getMapHospital: getIt.getIt(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Capston Project',
        home: LoginPage(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case MainPage.ROUTE_NAME:
              return CupertinoPageRoute(
                builder: (_) => MainPage(),
              );
            case LoginPage.ROUTE_NAME:
              return CupertinoPageRoute(
                builder: (_) => LoginPage(),
              );
            case RegisterPage.ROUTE_NAME:
              return CupertinoPageRoute(
                builder: (_) => RegisterPage(),
              );
            case HomePage.ROUTE_NAME:
              return CupertinoPageRoute(
                builder: (_) => HomePage(),
              );
            case BookmarkPage.ROUTE_NAME:
              return CupertinoPageRoute(
                builder: (_) => BookmarkPage(),
              );
            case ProfilePage.ROUTE_NAME:
              return CupertinoPageRoute(
                builder: (_) => ProfilePage(),
              );
            case ProvinceListPage.ROUTE_NAME:
              return CupertinoPageRoute(
                builder: (_) => ProvinceListPage(),
              );
            case NewsListPage.ROUTE_NAME:
              return CupertinoPageRoute(
                builder: (_) => NewsListPage(),
              );
            case NewsDetailPage.ROUTE_NAME:
              Map data = settings.arguments as Map;
              final String? url = data["url"];
              final Article? article = data["articles"];
              return CupertinoPageRoute(
                builder: (_) => NewsDetailPage(
                  url: url!,
                  article: article!,
                ),
              );
            case CityListPage.ROUTE_NAME:
              var provinceId = settings.arguments as String;
              return CupertinoPageRoute(
                builder: (_) => CityListPage(
                  provinceId: provinceId,
                ),
              );
            case HospitaleListPage.ROUTE_NAME:
              Map data = settings.arguments as Map;
              final String? provinceId = data["provinceId"];
              final String? cityId = data["cityId"];
              return CupertinoPageRoute(
                builder: (_) => HospitaleListPage(
                  provinceId: provinceId!,
                  cityId: cityId!,
                ),
              );
            case HospitalDetailPage.ROUTE_NAME:
              var hospitalId = settings.arguments as String;
              return CupertinoPageRoute(
                builder: (_) => HospitalDetailPage(
                  hospitalId: hospitalId,
                ),
              );
            default:
          }
        },
      ),
    );
  }
}
