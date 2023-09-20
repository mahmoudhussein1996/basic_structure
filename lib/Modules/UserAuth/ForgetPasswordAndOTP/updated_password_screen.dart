import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:bareq/Widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Theme/theme.dart';
import '../../../Widgets/app_title_widget.dart';

class UpdatedPasswordScreen extends StatelessWidget {
  static const String routeName = "updatedPasswordScreen";
  const UpdatedPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 36.h,),
            const AppTitleWidget(),
            SizedBox(height: 230.h,),
            Image.asset("assets/images/done.png", width: 58.w, height: 56.h,),
            SizedBox(height: 24.h,),
            TextDefaultWidget(title: "update_password".tr, color: ThemeClass.blackDarktColor,
            fontSize: 18.sp, fontWeight: FontWeight.w500,),
            const Spacer(),
            const DividerWidget()
          ],
        ),
      ),
    );
  }
}
