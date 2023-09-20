import 'package:bareq/Theme/theme.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartPointWidget extends StatelessWidget {
  String title, content;

  StartPointWidget({Key? key,required this.title,required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ThemeClass.greyColor)
      ),
      child: Row(
        children: [
          TextDefaultWidget(title: title, color: ThemeClass.blackDarktColor, fontSize: 14.sp, fontWeight: FontWeight.w600),
          SizedBox(width: 10.w),
          Expanded(child: TextDefaultWidget(title: content, color: ThemeClass.greyDarkColor, fontSize: 12.sp, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
