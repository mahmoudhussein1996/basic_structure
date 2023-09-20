import 'package:bareq/Modules/element/element_screen.dart';
import 'package:bareq/Theme/theme.dart';
import 'package:bareq/models/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Widgets/default_text_widget.dart';

class LessonItem extends StatelessWidget {
  Lesson lesson;

  LessonItem({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)
        => ElementScreen(name: lesson.enname!, id: lesson.id!,)));
      },
      child: Stack(
        children: [
          Container(
            width: 160.w, height: 144.h,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(lesson.image!))),
          ),
          Positioned(
            top: 104.h,
            child: Container(
              width:160.w, height: 44.h,
              decoration: BoxDecoration(color:ThemeClass.blackDarktColor.withOpacity(.4),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r))),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextDefaultWidget(title: lesson.enname!,fontSize: 12.sp, color: ThemeClass.whiteColor,
                      maxLines: 2,
                      textAlign: TextAlign.start,fontWeight: FontWeight.w500,),
                  ),
                  SizedBox(width: 14.w,),
                  InkWell(onTap:(){},child: SvgPicture.asset("assets/images/star.svg", color: ThemeClass.whiteColor,
                    width: 18.w, height: 18.h,))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
