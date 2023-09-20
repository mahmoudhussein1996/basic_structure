import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Shared/shared_preferances.dart';
import '../../Theme/theme.dart';
import '../../Utilities/Layout/general_app_background.dart';
import '../../Widgets/app_title_widget.dart';
import '../../Widgets/default_text_widget.dart';
import '../Home/main_screen.dart';
import '../OnboardingScreens/onboaring_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacementNamed(OnBoardingScreen.routeName);
    // if (!SharedPref.isWatchIntro()) {
    //   Modular.to.pushReplacementNamed(OnBoardingScreen.routeName);
    // } else
      if (SharedPref.isUserLogIn()) {
        Modular.to.pushReplacementNamed(MainScreen.routeName);
        print("still loged in ");
    } else {
      Modular.to.pushReplacementNamed(OnBoardingScreen.routeName);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration:  BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/splash.png"),
          ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ThemeClass.blueLightColor, ThemeClass.whiteColor]
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Spacer(),
              Image.asset('assets/images/bareq.png'),
              // Image.asset('assets/images/logo.png', height: 200.h,width: 200.w,),
              SizedBox(height: 16.h),
              AppTitleWidget(),
              // SizedBox(height: 14.h),
              SizedBox(height: 5.h,),
              TextDefaultWidget(
                title: 'welcome_to_bareq'.tr,
                color: ThemeClass.blackDarktColor,
                fontSize: 14.sp, fontWeight: FontWeight.w400
              ),
              SizedBox(height: 272.h),
              const DividerWidget(),
              SizedBox(height: 8.h,)
            ],
          ),
        ),
      ),
    );
  }
}
