import 'package:bareq/Theme/theme.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Widgets/custom_button_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../Models/level_model.dart';

class ProgressItem extends StatelessWidget {
  Level level;

   ProgressItem({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ThemeClass.normalgreyColor)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              Container(width: 136.w,height: 28.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),
              color: ThemeClass.brown),child: Center(child: TextDefaultWidget(title: level.enname!,
             fontSize: 10.sp, fontWeight: FontWeight.w500,))),
              Row(children: [
                SizedBox(width: 32.w),
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 35,
                      lineWidth: 10,
                      percent: double.parse(level.percentage!)/100,
                      center: TextDefaultWidget(title: "${level.percentage} %", color: ThemeClass.blackColor,
                        fontSize: 12.sp, fontWeight: FontWeight.w600,),
                      progressColor: ThemeClass.orangeColor,
                    ),
                    TextDefaultWidget(title: "level_test".tr, color: ThemeClass.mediumgreyColor,
                     fontSize: 12.sp, fontWeight: FontWeight.w400,)
                  ],
                ),
                SizedBox(width: 32.w),
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 52,
                      lineWidth: 20,
                      percent: level.progress!/100,
                      center: TextDefaultWidget(title: "${level.progress} %", color: ThemeClass.blackColor,
                        fontSize: 16.sp, fontWeight: FontWeight.w600,),
                      progressColor: ThemeClass.orangeColor,
                    ),
                    SizedBox(height: 8.h),
                    TextDefaultWidget(title: "progress".tr, color: ThemeClass.mediumgreyColor,
                      fontSize: 12.sp, fontWeight: FontWeight.w400,)
                  ],
                ),
              ],),
              Row(
                children: [
                  const Spacer(),
                  Container(
                      padding:EdgeInsets.all(8.w),
                      margin: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r),
                      color: ThemeClass.primaryColor),child: Center(child: TextDefaultWidget(title: "level_report".tr,
                    fontSize: 10.sp, fontWeight: FontWeight.w500,))),
                ],
              ),
            ]
          ),
        ),
        SizedBox(height: 10.h)
      ],
    );
  }
}
