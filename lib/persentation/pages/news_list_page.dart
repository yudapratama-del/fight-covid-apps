import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/common/state_enum.dart';
import 'package:capstone_apps/persentation/pages/news_detail_page.dart';
import 'package:capstone_apps/persentation/providers/news_notifier.dart';
import 'package:capstone_apps/persentation/widgets/news_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  static const ROUTE_NAME = "/news";
  const NewsListPage({Key? key}) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    Future.microtask(
      () => Provider.of<NewsNotifier>(context, listen: false).fetchNews(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGreen,
        title: Text("Daftar Berita Kesehatan"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getData();
        },
        child: Consumer<NewsNotifier>(
          builder: (context, data, _) {
            if (data.newsState == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.newsState == RequestState.Loaded) {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data.news!.length,
                itemBuilder: (BuildContext context, int index) {
                  return NewsItem(
                    article: data.news![index],
                    index: index,
                    onTap: () {
                      print("CLICKED");
                      Navigator.pushNamed(
                        context,
                        NewsDetailPage.ROUTE_NAME,
                        arguments: data.news![index].url,
                      );
                    },
                  );
                },
              );
            } else {
              return Center(
                child: Text(data.msg!),
              );
            }
          },
        ),
      ),
    );
  }
}
