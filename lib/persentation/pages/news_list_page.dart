import 'package:capstone_apps/persentation/widgets/news_item.dart';
import 'package:flutter/material.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  static List dataTest = [1,1,1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Berita Kesehatan"),),
      body: ListView.builder(
          itemCount: dataTest.length,
          itemBuilder: (BuildContext context, int index) {
            return NewsItem();
          }),
    );
  }
}
