import 'package:bareq/Modules/Home/home_widgets/start_point_widget.dart';
import 'package:bareq/Modules/Units/units_screen.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Utilities/Layout/loading_screen.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import 'home_controller.dart';
import '../Units/units_widgets/unit_item_widget.dart';
import 'home_widgets/user_level_item_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<HomeScreen> {

  _HomeScreenState() : super(HomeController()) {
    con = HomeController();
  }

  late HomeController con;

  @override
  void initState() {

    if(con.levels.isEmpty )
      {
        con.getAllLevels(context);
      }
    if(con.userStudy == null)
    {
      con.getUserStudy();
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeClass.blueLightColor5,
        body: LoadingScreen(
          loading: con.loading,
          child: Stack(
            children: [
              Image.asset("assets/images/homeVector.png"),
              SizedBox(height: 60.h,),
              Column(
                children: [
                  SizedBox(height: 80.h),
                  Padding(
                    padding:  EdgeInsets.only(left: 36.w),
                    child: Row(
                      children: [
                        CircleAvatar(radius:22.r,backgroundImage: const NetworkImage(Helper.defaultNetworkImage),),
                        SizedBox(width: 12.w,),
                        SizedBox(
                          width: 184.w, height: 42.h,
                          child: TextDefaultWidget(title: "${"hello".tr} ${con.user.name} ${"start_learn".tr}", maxLines: 2,
                            fontSize: 14.sp, fontWeight: FontWeight.w500, color: ThemeClass.whiteColor, textAlign: TextAlign.start,),
                        ),
                      ],)
                  ),
                  SizedBox(height: 80.h),
                  con.loadUserStudy ? const Center(child: CircularProgressIndicator(),):Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),
                  color: ThemeClass.whiteColor),
                  child: Column(
                    children: [
                     StartPointWidget(title: "start_point".tr, content: "${con.userStudy!.startPoint!.level!.enname!} - "
                         "${con.userStudy!.startPoint!.unit!.enname!} - ${con.userStudy!.startPoint!.lesson!.enname!}"),
                     SizedBox(height: 10.h),
                     StartPointWidget(title: "current_level".tr, content: "${con.userStudy!.currentLevel!.level!.enname!} - "
                         "${con.userStudy!.currentLevel!.unit!.enname!} - ${con.userStudy!.currentLevel!.lesson!.enname!}"),
                    ],
                  ),
                  ),
                  SizedBox(height: 40.h),
                  Expanded(
                    child: ListView.builder(
                      //physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: con.levels.length,
                      itemBuilder: (context,index){
                      return UserLevelItem(level: con.levels[index],);
                    }),
                  )
                ],
              ),
            ],
          ),
        )
    );
  }
}
