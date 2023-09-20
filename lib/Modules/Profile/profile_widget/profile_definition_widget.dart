import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Theme/theme.dart';
import '../../../Utilities/Layout/helper.dart';
import '../../../Widgets/default_text_widget.dart';
class ProfileDefinitionWidget extends StatelessWidget {
  String profileTitle;
   ProfileDefinitionWidget({Key? key,required this.profileTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(radius:40.r,backgroundImage:  const NetworkImage(Helper.defaultNetworkImage),),
            Positioned(left: 50.w, top: 48.h,
              child: Container(width:34.w, height:34.h,decoration:BoxDecoration(borderRadius: BorderRadius.circular(17.r), color: ThemeClass.whiteColor.withOpacity(.8),),
                  child: SvgPicture.asset(width: 7, height: 7, "assets/images/edit.svg", fit: BoxFit.scaleDown,)),
            )
          ],
        ),
        SizedBox(height: 16.h,),
        TextDefaultWidget(title: profileTitle, fontSize: 20.sp, color: ThemeClass.blackColor,fontWeight: FontWeight.w500,),
        Row( mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width:34.w, height:34.h,decoration:BoxDecoration(
                color: ThemeClass.whiteColor.withOpacity(.8),
                borderRadius: BorderRadius.circular(17.r)),
              child: SvgPicture.asset("assets/images/champion.svg", width: 5.w, height: 6.h,fit: BoxFit.scaleDown,),), SizedBox(width: 16.w,), TextDefaultWidget(title: "bareq_hero".tr,
              color: ThemeClass.primaryColor, fontSize: 12.sp, fontWeight: FontWeight.w500,)
          ],),
        SizedBox(height: 14.h,),
      ],
    );
  }
}
