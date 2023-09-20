import 'package:bareq/Modules/Favorites/favorites_controller.dart';
import 'package:bareq/Modules/Progress/progress_controller.dart';
import 'package:bareq/Modules/Progress/progress_widgets/progress_item.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import '../../Widgets/back_button_widget.dart';
import '../../Widgets/default_text_widget.dart';

class ProgressScreen extends StatefulWidget {
  static const String routeName = "/ProgressScreen";
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends StateMVC<ProgressScreen> {

  _ProgressScreenState() : super(ProgressController()) {
    con = ProgressController();
  }

  late ProgressController con;

  @override
  void initState() {
   con.getAllLevels(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: ThemeClass.whiteColor,
      //   leading: const BackButtonWidget(),
      //   elevation: 10,
      //   title:  TextDefaultWidget(title: "overall_process".tr, fontSize: 16.sp, color: ThemeClass.blackColor,fontWeight: FontWeight.w400,),
      // ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 22.h),
              Row(children: [
                BackButtonWidget(),
                SizedBox(width: 20.w,),
                TextDefaultWidget(title: "overall_process".tr, fontSize: 16.sp,
                 color: ThemeClass.blackColor,fontWeight: FontWeight.w400,),
              ],),
              SizedBox(height: 22.h),
              Expanded(child: ListView.builder(
                itemCount: con.levels.length,
                  itemBuilder: (context, index){
                return ProgressItem(level: con.levels[index],);
              }))
            ],
          ),
        ),
      ),
    );
  }
}
