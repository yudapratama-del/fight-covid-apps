import 'package:capstone_apps/common/constants.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatefulWidget {
  static const ROUTE_NAME = "/news-detail";

  const NewsDetailPage({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

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
    return Card(
      color: kDeepGreen,
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
        ],
      ),
    );
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
