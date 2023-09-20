import 'package:bareq/Modules/Profile/profile_controller.dart';
import 'package:bareq/Modules/Profile/profile_widget/profile_definition_widget.dart';
import 'package:bareq/Widgets/back_button_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import '../../Utilities/Layout/helper.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/custom_textfeild_widget.dart';


class SubscriptionProfileScreen extends StatefulWidget {
  SubscriptionProfileScreen({Key? key}) : super(key: key);

  static const String routeName = "/SubscriptionProfileScreen";

  @override
  _SubscriptionProfileScreenState createState() => _SubscriptionProfileScreenState();
}

class _SubscriptionProfileScreenState extends StateMVC<SubscriptionProfileScreen> {

  _SubscriptionProfileScreenState() : super(ProfileController()) {
    con = ProfileController();
  }
  late ProfileController con;

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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                SizedBox(height: 28.h,),
                ProfileDefinitionWidget(profileTitle: con.user!.name),
                SizedBox(height: 16.h,),
                Row(children: [SvgPicture.asset("assets/images/subscription.svg"), SizedBox(width: 18.w,), TextDefaultWidget(title: "subscription".tr, color: ThemeClass.orangeColor,
                  fontSize: 20.sp, fontWeight: FontWeight.w500,),],),
                SizedBox(height: 46.h,),
                Center(
                  child:
                      Container(
                        decoration: BoxDecoration(color: ThemeClass.blueLightColor3,
                         borderRadius: BorderRadius.circular(7.r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 44.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 38.w),
                              child: TextDefaultWidget(title: "package_plan".tr, fontSize: 13.sp, fontWeight: FontWeight.w600,
                                color: ThemeClass.greyColor,),
                            ),
                            SizedBox(height: 2.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 64.w),
                              child: TextDefaultWidget(title: "one month", fontSize: 13.sp, fontWeight: FontWeight.w600,
                              color: ThemeClass.orangeColor,),
                            ),
                            SizedBox(height: 2.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 74.w),
                              child: TextDefaultWidget(title: "10" "\$", fontSize: 32.sp, fontWeight: FontWeight.w600,
                              color: ThemeClass.primaryColor,),
                            ),
                            SizedBox(height: 8.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 22.w),
                              child: TextDefaultWidget(title: "start_date".tr+ "22/03/2023", fontSize: 13.sp, fontWeight: FontWeight.w600,
                                color: ThemeClass.normalgreyColor,),
                            ),
                            SizedBox(height: 20.h,),
                          ],
                        ),
                      ),
                ),
                SizedBox(height: 16.h,),
                Center(
                  child: TextDefaultWidget(title: "renew_date".tr, fontSize: 20.sp, fontWeight: FontWeight.w500,
                    color: ThemeClass.blackColor,),
                ),
                SizedBox(height: 8.h,),
                Center(
                  child: TextDefaultWidget(title: "next".tr +"  "+ "22/04/2023", fontSize: 13.sp, fontWeight: FontWeight.w600,
                    color: ThemeClass.greyColor,),
                ),
                SizedBox(height: 36.h,),
                CustomButton(title: "renew_subscription".tr, radius: 6.r,backgroundColor: ThemeClass.primaryColor,onTap: (){}),
              ],
            ),
            Positioned(
                top: 270.h, right: 110.w,
                child: Image.asset("assets/images/graduation.png", width: 98.w, height: 74.h, fit: BoxFit.scaleDown,))
          ],
        ),
      ),);
  }
}
