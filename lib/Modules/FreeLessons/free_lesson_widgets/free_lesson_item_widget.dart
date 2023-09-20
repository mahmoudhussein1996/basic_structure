import 'package:bareq/Theme/theme.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/lesson_model.dart';
class FreeLessonItemWidget extends StatefulWidget {

  Lesson lesson;
   FreeLessonItemWidget({Key? key, required this.lesson}) : super(key: key);

  @override
  State<FreeLessonItemWidget> createState() => _FreeLessonItemWidgetState();
}

class _FreeLessonItemWidgetState extends State<FreeLessonItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 30.h,),
          Stack(
            children: [
              Container(
                width: 328.w,
                height: 150.h,
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.lesson.image!,),fit: BoxFit.cover,),
                borderRadius: BorderRadius.circular(12.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(alignment:Alignment.topRight,child: InkWell(child: SvgPicture.asset("assets/images/star.svg", color: ThemeClass.whiteColor,))),
                    SizedBox(height: 48.h,),
                    TextDefaultWidget(title: widget.lesson.enname!, color: ThemeClass.whiteColor, fontSize: 16.sp,
                    fontWeight: FontWeight.w600,),
                    SizedBox(height: 2.h,),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                      width:30.w,height: 30.h,decoration: BoxDecoration(color: ThemeClass.whiteColor.withOpacity(.4),
                      borderRadius: BorderRadius.circular(15.r)),
                      child:  SvgPicture.asset("assets/images/arrow_right.svg",width: 12.w, height: 12.h ,fit: BoxFit.scaleDown,color: ThemeClass.whiteColor,),),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                 gradient: LinearGradient(
                  colors: [
                    ThemeClass.blackDarktColor.withOpacity(0),
                    ThemeClass.blackDarktColor.withOpacity(.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),),
              )
            ],
          ),
        ],
      ),
    );
  }
}
