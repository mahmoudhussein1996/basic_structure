import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Theme/theme.dart';
import '../../Utilities/consts.dart';
import '../../Widgets/back_button_widget.dart';
import '../../Widgets/default_text_widget.dart';

class AboutScreen extends StatefulWidget {
  static const String routeName = "/AboutScreen";
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeClass.whiteColor,
        shadowColor: ThemeClass.greyLightColor,
        leading:  BackButtonWidget(),
        elevation: 10,
        title:  TextDefaultWidget(title: "my_profile".tr, fontSize: 16.sp, color: ThemeClass.blackColor,fontWeight: FontWeight.w400,),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 32.h,),
            Row(children: [SvgPicture.asset("assets/images/info.svg"),
              SizedBox(width: 18.w,), TextDefaultWidget(title: "about".tr, color: ThemeClass.orangeColor,
              fontSize: 20.sp, fontWeight: FontWeight.w500,),],),
            SizedBox(height: 32.h,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: ThemeClass.blueLightColor3)
              ),
            child: Image.asset("assets/images/about.png")),
            SizedBox(height: 50.h,),
            TextDefaultWidget(title:Consts.aboutUs, color: ThemeClass.mediumgreyColor,
            fontSize: 12.sp, fontWeight: FontWeight.w500, maxLines: 15,)
          ],
        ),
      ),
    );
  }
}
