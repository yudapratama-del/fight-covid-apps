import 'package:cached_network_image/cached_network_image.dart';
import 'package:capstone_apps/common/api_key.dart';
import 'package:capstone_apps/common/constants.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const ROUTE_NAME = "/profile-page";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: kLightGreen,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: CachedNetworkImage(
                    imageUrl: IMAGE_URL,
                    height: 64,
                    width: 64,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jhon Doe",
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: kSubtitle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Jhone@gmail.com",
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: kSubtitle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.exit_to_app,
                    color: kBlack,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem({String text = "", Function? onTap}) {
      return InkWell(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: kSubtitle.copyWith(
                  fontSize: 13,
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: kBlack,
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: kWhite,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "General",
                  style: kSubtitle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                menuItem(
                  text: "Help",
                  onTap: () {},
                ),
                menuItem(
                  text: "Privacy & Policy",
                  onTap: () {},
                ),
                menuItem(
                  text: "Term of Service",
                  onTap: () {},
                ),
                menuItem(
                  text: "Rate App",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
