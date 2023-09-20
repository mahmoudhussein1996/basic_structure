import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Theme/theme.dart';
import '../../../../Widgets/default_text_widget.dart';
class CofirmButtonWidget extends StatelessWidget {
  String title;
  Color color;
  Function() onTap;
   CofirmButtonWidget({Key? key, required this.title, required this.color, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 56.h),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: ThemeClass.whiteColor),
        child: Center(child: TextDefaultWidget(
          title: title,
          color: color,
        ),),
      ),
    );
  }
}
