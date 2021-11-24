import 'package:cached_network_image/cached_network_image.dart';
import 'package:capstone_apps/common/constants.dart';
import 'package:capstone_apps/domain/entities/articles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsItem extends StatefulWidget {
  const NewsItem({
    Key? key,
    required this.onTap,
    required this.article,
    required this.index,
  }) : super(key: key);

  final Article article;
  final int index;
  final Function onTap;

  @override
  _NewsItemState createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  bool _animate = false;
  static bool _isStart = true;

  @override
  void initState() {
    super.initState();
    _isStart
        ? Future.delayed(Duration(milliseconds: widget.index * 100), () {
            setState(() {
              _animate = true;
              _isStart = false;
            });
          })
        : _animate = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 1000),
      opacity: _animate ? 1 : 0,
      curve: Curves.easeInOutQuart,
      child: ListTile(
        onTap: () {
          widget.onTap();
        },
        contentPadding: EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          child: CachedNetworkImage(
            imageUrl: "${widget.article.urlToImage}",
            width: 80,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        title: Text(
          widget.article.title!,
          style: kSubtitle,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text("Annisa Karnesyia"),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border_rounded, color: kRed),
        ),
      ),
    );
  }
}
