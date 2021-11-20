import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  static const ROUTE_NAME = "/bookmark-page";
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Bookmark Page"),
      ),
    );
  }
}
