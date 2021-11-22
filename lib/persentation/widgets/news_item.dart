import 'package:capstone_apps/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        child: Image.asset(
          "assets/images/news_placeholder.png",
          fit: BoxFit.cover,
          width: 80,
        ),
      ),
      title: Text(
        "10 Faktor Risiko Kelahiran Prematur, Ada yang Bisa Dicegah Sebelum Hamil Bun - Haibunda",
        style: kSubtitle,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text("Annisa Karnesyia"),
      trailing: IconButton(
        onPressed: () {
          print("AAAAAAAAAAAAAAAAAAAAAAAAAA");
        },
        icon: Icon(Icons.favorite_border_rounded, color: kRed),
      ),
    );
  }
}
