import 'package:capstone_apps/common/constants.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  

  Widget CustomAppBar() {
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
            icon: Icon(Icons.arrow_back, color: kWhite,),
            onPressed: () {
              print("Back");
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
          children: [NewsWebView(), CustomAppBar()],
        ),
      ),
    );
  }
}
