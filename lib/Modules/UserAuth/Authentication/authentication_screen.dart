import 'package:bareq/Modules/UserAuth/Authentication/authentication_controller.dart';
import 'package:bareq/Modules/UserAuth/Authentication/authentication_widgets/sign_in_widget.dart';
import 'package:bareq/Modules/UserAuth/Authentication/authentication_widgets/sign_up_widget.dart';
import 'package:bareq/Theme/theme.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Utilities/Layout/loading_screen.dart';
import '../../../Widgets/app_title_widget.dart';
import '../../../Widgets/begin_bareq_text_widget.dart';

class AuthenticationScreen extends StatefulWidget {
  static const String routeName = "/authenticationScreen";
  int currentIndex = 0;

   AuthenticationScreen({Key? key,required this.currentIndex}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends StateMVC<AuthenticationScreen>
    with SingleTickerProviderStateMixin {
  // controller to control tabBar
  late TabController authenticateController;
  late AuthenticationController con;

  @override
  void initState() {
    super.initState();
    authenticateController = TabController(length: 2, initialIndex: widget.currentIndex!,vsync: this);
    con = AuthenticationController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 36.h,
            ),
            const AppTitleWidget(),
            SizedBox(
              height: 12.h,
            ),
            const BeginBareqText(),
            SizedBox(
              height: 24.h,
            ),
            TabBar(controller: authenticateController, tabs: [
              Tab(
                child: TextDefaultWidget(
                  title: "sign_in".tr,
                  color: ThemeClass.primaryColor,
                ),
              ),
              Tab(
                child: TextDefaultWidget(
                  title: "sign_up".tr,
                  color: ThemeClass.normalgreyColor,
                ),
              ),
            ]),
            SizedBox(
              height: 20.h,
            ),
             Expanded(
              child: TabBarView(controller: authenticateController, children:  [
                 SignInWidget(controller: con),
                 SignUpWidget(controller: con)
              ]),
            )
          ],
        ),
      )),
    );
  }
}
