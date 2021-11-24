import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/domain/entities/articles.dart';
import 'package:capstone_apps/persentation/providers/news_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatefulWidget {
  static const ROUTE_NAME = "/news-detail";

  const NewsDetailPage({
    Key? key,
    required this.url,
    required this.article,
  }) : super(key: key);

  final String url;
  final Article article;

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool isLoading = true;

  Widget newsWebView() {
    return WebView(
      initialUrl: widget.url,
      onPageFinished: (finish) {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  Widget customAppBar(BuildContext context) {
    bool isAddedBookmark = Provider.of<NewsNotifier>(context).isAddedToBookmark;
    return Card(
      color: kLightGreen,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16.0),
        ),
      ),
      margin: EdgeInsets.all(0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kWhite,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              'Fight Covid',
              style: kHeading6.copyWith(color: kWhite),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: isAddedBookmark ? kRed : kWhite,
            ),
            onPressed: () async {
              if (!isAddedBookmark) {
                await Provider.of<NewsNotifier>(context, listen: false)
                    .addNewsBookmark(widget.article);
              } else {
                await Provider.of<NewsNotifier>(context, listen: false)
                    .removeFromBookmark(widget.article);
              }

              final message =
                  Provider.of<NewsNotifier>(context, listen: false).bookmarkMsg;

              if (message == NewsNotifier.bookmarkAddSuccessMsg ||
                  message == NewsNotifier.bookmarkRemoveSuccessMsg) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(message),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    print(widget.url);

    Future.microtask(
      () => Provider.of<NewsNotifier>(context, listen: false)
          .loadBookmark(widget.url),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            newsWebView(),
            isLoading ? Center(child: CircularProgressIndicator()) : SizedBox(),
            customAppBar(context),
          ],
        ),
      ),
    );
  }
}
