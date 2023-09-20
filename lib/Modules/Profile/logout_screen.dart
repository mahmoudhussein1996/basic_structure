import 'package:bareq/Modules/Profile/profile_controller.dart';
import 'package:bareq/Modules/UserAuth/Authentication/authentication_screen.dart';
import 'package:bareq/Shared/shared_preferances.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import '../../Utilities/Layout/loading_screen.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/divider_widget.dart';

class LogoutScreen extends StatefulWidget {
  static const String routeName = "/LogoutScreen";
   LogoutScreen({Key? key}) : super(key: key);

  @override
  _LogoutScreenState createState() => _LogoutScreenState();
}

class _LogoutScreenState extends StateMVC<LogoutScreen> {

  bool load = false;

   _LogoutScreenState() : super(ProfileController()) {
     con = ProfileController();
   }
   late ProfileController con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Stack(
            children: [
              Positioned(
                  right: 0.w,
                  top: 20.h,
                  child: Image.asset("assets/images/onboarding_vec.png")),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft, end: Alignment.bottomRight,
                  colors:
                  [
                    ThemeClass.blueLightColor4,
                    ThemeClass.whiteColor.withOpacity(.54)
                  ])
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 80.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 60.w,
                        ),
                        Image.asset(
                          "assets/images/maged.png",
                          width: 200.w,
                          height: 394.h,
                          fit: BoxFit.scaleDown,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 66.h,
                    ),
                    CustomButton(
                        title: "logout".tr,
                        backgroundColor: ThemeClass.primaryColor,
                        textColor: ThemeClass.whiteColor,
                        radius: 6.r,
                        onTap: () {
                          con.logOut(context);
                        }),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                        title: "cancel".tr,
                        radius: 6.r,
                        textColor: ThemeClass.primaryColor,
                        borderColor: ThemeClass.primaryColor,
                        backgroundColor: Colors.transparent,
                        onTap: () {Navigator.pop(context);}),
                    SizedBox(height: 90.h,),
                    const Center(child:  DividerWidget()),
                    SizedBox(height: 8.h,),
                  ],
                ),
              ),
              Positioned(
                  right: 30.w,
                  top: 90.h,
                  child: Image.asset("assets/images/bareq_onboard.png",
                      width: 118.w, height: 88.h, fit: BoxFit.scaleDown))
            ],
          ),
        ),
      ),
    );
  }
}
