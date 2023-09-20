import 'package:bareq/Modules/Units/unit_test_screen.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Utilities/Layout/loading_screen.dart';
import 'package:bareq/Widgets/custom_button_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import 'lesson_controller.dart';
import 'lesson_widgets/lesson_item_widget.dart';

class LessonScreen extends StatefulWidget {
  static String routeName = "/LessonScreen";

  String name;
  int id;

  LessonScreen({Key? key, required this.id, required this.name}) : super(key: key);

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends StateMVC<LessonScreen> {

  _LessonScreenState() : super(LessonController()) {
    con = LessonController();
  }

  late LessonController con;

  @override
  void initState() {
    con.getAllLessonByUnitId(context, widget.id);
    super.initState();
  }
  //

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ThemeClass.blueLightColor5,
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
                children: [
                  SizedBox(height: 24.h,),
                  Row(
                    children: [
                    BackButton(color: ThemeClass.whiteColor,),
                    Expanded(child: TextDefaultWidget(title: widget.name, color: ThemeClass.whiteColor, fontSize: 16.sp, fontWeight: FontWeight.w600,)),
                    SizedBox(width: 30.w,),
                    CustomButton(width:156.w,height: 48.h,backgroundColor: ThemeClass.whiteColor, radius: 6.r,
                    title: "unit_test".tr,borderColor: ThemeClass.whiteColor,textColor: ThemeClass.mediumgreyColor,fontSize: 11.sp, fontWeight: FontWeight.w500,
                    horizontalPadding: 8.w,verticalPadding: 8.h,onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> UnitTestScreen(testUrl: con.lessons[0].unitTest!,)));
                    })

                  ],),
                  SizedBox(height: 22.h,),
                  con.lessons.isEmpty? Column(
                    children: [
                      SizedBox(height: 300.h,),
                      TextDefaultWidget(title: "no_lesson".tr, textAlign: TextAlign.center,color: ThemeClass.mediumgreyColor,
                        fontSize: 14.sp, fontWeight: FontWeight.w600,),
                    ],
                  ):Expanded(
                    child: GridView.builder(
                        itemCount: con.lessons.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 9.w,
                            mainAxisSpacing: 16.h
                        ), itemBuilder: (context, index)
                    {
                      return LessonItem(lesson: con.lessons[index],);
                    }),
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}
