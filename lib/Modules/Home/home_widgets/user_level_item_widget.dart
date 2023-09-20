import 'package:bareq/Modules/Home/home_controller.dart';
import 'package:bareq/Modules/Lessons/lesson_screen.dart';
import 'package:bareq/Modules/element/element_screen.dart';
import 'package:bareq/Theme/theme.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Widgets/custom_button_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:bareq/Models/level_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Units/units_screen.dart';

class UserLevelItem extends StatefulWidget {
  Level level;
  UserLevelItem({Key? key, required this.level}) : super(key: key);

  @override
  _UserLevelItemState createState() => _UserLevelItemState();
}

class _UserLevelItemState extends StateMVC<UserLevelItem> {

  _UserLevelItemState() : super(HomeController()) {
    con = HomeController();
  }

  late HomeController con;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(widget.level.id == 6)
          {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)
            => LessonScreen(name: widget.level.enname!, id: widget.level.id!)));

          }
        else
          {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)
            => UnitsScreen(levelName: widget.level.enname!, levelId: widget.level.id!, levelTest: widget.level.levelTest!,)));
          }
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
            decoration: BoxDecoration(
              color: ThemeClass.whiteColor,
              borderRadius: BorderRadius.circular(6.r)
            ),
            child: Column(
              children: [
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  TextDefaultWidget(title: widget.level.enname!, color: ThemeClass.brown, fontSize: 14.sp, fontWeight: FontWeight.w500,),
                  SizedBox(width: 35.w,),
                   TextDefaultWidget(title: "${widget.level.unitsCount.toString()}  " + "unit".tr, color: ThemeClass.orangeColor, fontSize: 12.sp, fontWeight: FontWeight.w500,),
                ],),
                SizedBox(height: 10.h,),
                Container(
                  width: 100.w, height: 100.w,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    //border: Border.all(color: ThemeClass.blueLightColor3,),
                  image: DecorationImage(image: NetworkImage(widget.level.image!)),),
                ),
                SizedBox(height: 24.h,),
                ClipRRect(
               borderRadius: BorderRadius.circular(15.r),
                child: LinearProgressIndicator(value:widget.level.progress!.toDouble(),minHeight:12, valueColor: AlwaysStoppedAnimation<Color>(Color(0xffFF9500).withOpacity(.4)), backgroundColor: ThemeClass.blueLightColor3,)),
                SizedBox(height: 16.h,),
                con.loadUserStudy ? const Center(child: CircularProgressIndicator(),):
                con.userStudy!.currentLevel!.level!.id == widget.level.id ?  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 70.w),
                  child: CustomButton(title: "continue learning",textColor: ThemeClass.primaryColor,radius: 6.r,
                  borderColor: ThemeClass.primaryColor,fontSize: 10.sp,onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> ElementScreen(id: con.userStudy!.currentLevel!.lesson!.id!, name: con.userStudy!.currentLevel!.lesson!.enname!)));
                   }),
                ) : const SizedBox()
              ],
            ),
          ),
          SizedBox(height: 16.h,)
        ],
      ),
    );
  }
}
