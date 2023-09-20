import 'package:bareq/Modules/Favorites/favorites_controller.dart';
import 'package:bareq/Modules/FreeLessons/free_lesson_controller.dart';
import 'package:bareq/Modules/Home/home_screen.dart';
import 'package:bareq/Modules/PlacementTest/placement_test_controller.dart';
import 'package:bareq/Modules/PlacementTest/placement_test_screen.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import '../../Widgets/back_button_widget.dart';
import '../../Widgets/default_text_widget.dart';

class PlacementTestStartScreen extends StatefulWidget {
  static const String routeName = "/PlacementTestStartScreen";
  const PlacementTestStartScreen({Key? key}) : super(key: key);

  @override
  _PlacementTestStartScreenState createState() => _PlacementTestStartScreenState();
}

class _PlacementTestStartScreenState extends StateMVC<PlacementTestStartScreen> {

  _PlacementTestStartScreenState() : super(PlacementTestController()) {
    con = PlacementTestController();
  }

  late PlacementTestController con;

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    ThemeClass.blueLightColor6.withOpacity(0),
                    ThemeClass.blueLightColor7,
                  ]
              )
          ),
          child: Column(
            children: [
              TextDefaultWidget(title: "time_to_learn", fontSize: 32.sp, fontWeight: FontWeight.w600),
              SizedBox(height: 4.h),
              TextDefaultWidget(title: "time_to_learn_desc", fontSize: 16.sp, fontWeight: FontWeight.w500),
              SizedBox(height: 32.h),
              Image.asset("assets/images/maged.png", width: 136.w, height: 376.h, fit: BoxFit.scaleDown,),
              SizedBox(height: 24.h),
              CustomButton(title: "take_placement_test",radius: 6.r,backgroundColor: ThemeClass.whiteColor,
                  textColor: ThemeClass.primaryColor, borderColor: ThemeClass.whiteColor,
                  onTap: (){
                     Navigator.pushNamed(context, PlacementTestScreen.routeName);
                  }),
              SizedBox(height: 14.h),
              CustomButton(title: "start_learning",radius: 6.r,backgroundColor: Colors.transparent, borderColor: ThemeClass.whiteColor,
                  onTap: (){
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
