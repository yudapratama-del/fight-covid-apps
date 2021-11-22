import 'package:capstone_apps/common/constants.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  

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
