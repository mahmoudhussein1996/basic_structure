import 'package:bareq/Modules/FreeLessons/free_lesson_controller.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import '../../Widgets/back_button_widget.dart';
import '../../Widgets/default_text_widget.dart';
import 'free_lesson_widgets/free_lesson_item_widget.dart';
class FreeLessonScreen extends StatefulWidget {
  static const String routeName = "/FreeLessonScreen";
  const FreeLessonScreen({Key? key}) : super(key: key);

  @override
  _FreeLessonScreenState createState() => _FreeLessonScreenState();
}

class _FreeLessonScreenState extends StateMVC<FreeLessonScreen> {

  _FreeLessonScreenState() : super(FreeLessonController()) {
    con = FreeLessonController();
  }

  late FreeLessonController con;

 @override
  void initState() {
   con.getFreeLesson(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeClass.whiteColor,
        shadowColor: ThemeClass.greyLightColor,
        leading:  BackButtonWidget(),
        elevation: 10,
        title:  TextDefaultWidget(title: "explore_our_lesson".tr, fontSize: 16.sp, color: ThemeClass.blackColor,fontWeight: FontWeight.w400,),
      ),
      body: SizedBox(
        child: ListView.builder(
        itemCount: con.lessons.length,
        itemBuilder: (context, index)
        {
          return FreeLessonItemWidget(lesson: con.lessons[index],);
        }),
      ),
    );
  }
}
