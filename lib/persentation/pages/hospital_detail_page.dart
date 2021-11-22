import 'package:capstone_apps/common/constants.dart';
import 'package:flutter/material.dart';

class HospitalDetailPage extends StatelessWidget {
  const HospitalDetailPage({Key? key}) : super(key: key);

  static List dataTest = [1, 1, 1, 1, 1, 1];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(context), 
              RoomList(context)
              ],
          ),
        ),
      ),
    );
  }
}
