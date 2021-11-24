import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/common/state_enum.dart';
import 'package:capstone_apps/persentation/pages/news_detail_page.dart';
import 'package:capstone_apps/persentation/providers/news_notifier.dart';
import 'package:capstone_apps/persentation/widgets/news_item.dart';
import 'package:capstone_apps/persentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatefulWidget {
  static const ROUTE_NAME = "/bookmark";

  const BookmarkPage({
    Key? key,
  }) : super(key: key);

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () =>
          Provider.of<NewsNotifier>(context, listen: false).fetchBookmarkNews(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGreen,
        title: Text("News Bookmark"),
      ),
      body: Column(
        children: [
          TextFieldWidget(
            controller: editingController,
            onChange: () {
              setState(() {});
            },
          ),
          Consumer<NewsNotifier>(
            builder: (context, data, _) {
              if (data.bookmarkState == RequestState.Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.bookmarkState == RequestState.Loaded) {
                return Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: data.bookmarkNews.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsItem(
                        article: data.bookmarkNews[index],
                        index: index,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            NewsDetailPage.ROUTE_NAME,
                            arguments: {
                              "url": data.bookmarkNews[index].url,
                              "articles": data.bookmarkNews[index]
                            },
                          ).then(
                            (value) => Future.microtask(
                              () => Provider.of<NewsNotifier>(context,
                                      listen: false)
                                  .fetchBookmarkNews(),
                            ),
                          );
                        },
                      );
                    },
                  ),
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
}
