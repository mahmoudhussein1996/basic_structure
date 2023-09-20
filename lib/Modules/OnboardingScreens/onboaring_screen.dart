import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bareq/Modules/UserAuth/Authentication/authentication_screen.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Widgets/custom_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Theme/theme.dart';
import '../../Widgets/app_title_widget.dart';
import '../../Widgets/begin_bareq_text_widget.dart';
import '../../Widgets/custom_button_gradient_widget.dart';
import '../../Widgets/default_text_widget.dart';
import '../../Widgets/divider_widget.dart';
import '../FreeLessons/free_lesson_screen.dart';
import '../UserAuth/RegisterType/register_type_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = "/OnBoardingScreen";

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                right: 0.w, top: 0.h,
                child: Image.asset("assets/images/onboarding_vec.png")),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  const Center(child: AppTitleWidget()),
                  const Center(child: BeginBareqText()),
                  SizedBox(height: 30.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 60.w,),
                      Image.asset("assets/images/maged.png", width: 200.w, height: 354.h, fit: BoxFit.scaleDown,),
                    ],
                  ),
                  SizedBox(height: 30.h,),
                  CustomButton(title: "explore_free_lesson".tr,textColor: ThemeClass.primaryColor,radius: 6.r,borderColor: ThemeClass.primaryColor,onTap: (){
                    Navigator.pushNamed(context, FreeLessonScreen.routeName);
                  }),
                  SizedBox(height: 20.h,),
                  CustomButton(title: "register".tr,radius: 6.r,backgroundColor: ThemeClass.primaryColor,onTap: (){
                    Navigator.pushNamed(context, AuthenticationScreen.routeName, arguments: 1);
                  }),
                  SizedBox(height: 20.h,),
                  CustomButton(title: "sign_in".tr,radius: 6.r,backgroundColor: ThemeClass.primaryColor,onTap: (){
                    Navigator.pushNamed(context, AuthenticationScreen.routeName, arguments: 0);
                  }),
                  SizedBox(height: 20.h,),
                  Center(child: const DividerWidget()),
                  SizedBox(height: 8.h,),
                ],
              ),
            ),
            Positioned(
            right: 30.w, top: 150.h,
            child: Image.asset("assets/images/bareq_onboard.png", width: 118.w, height: 88.h,fit: BoxFit.scaleDown))
          ],
        ),
      ),
    );
  }
}
