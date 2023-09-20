import 'package:bareq/Theme/theme.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AddressItemWidget extends StatelessWidget {
  const AddressItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextDefaultWidget(title: "Egypt", color: ThemeClass.blackColor,
        fontWeight: FontWeight.w400, fontSize: 10.sp,),
        SizedBox(height: 5.h,),
        TextDefaultWidget(title: "Block 6005,Area (ج) ,Street # 23,Al-Hadba"
            " ALolya,Mokattam ,Alkhalifa- Cairo. Tel: +20 25055163",
          color: ThemeClass.mediumgreyColor,
          fontWeight: FontWeight.w400, fontSize: 10.sp,),
        SizedBox(height: 20.h,),
      ],
    );
  }
}
