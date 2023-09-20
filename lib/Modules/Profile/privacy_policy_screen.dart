import 'package:bareq/Modules/Profile/profile_controller.dart';
import 'package:bareq/Modules/Profile/profile_widget/privacy_policy_item_widget.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Theme/theme.dart';
import '../../Widgets/back_button_widget.dart';
import '../../Widgets/default_text_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {

  static const String routeName = "/PrivacyPolicyScreen";

   PrivacyPolicyScreen({Key? key}) : super(key: key);

  ProfileController profileController = ProfileController();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            SizedBox(height: 32.h,),
            Row(children: [SvgPicture.asset("assets/images/info.svg"), SizedBox(width: 18.w,),
              TextDefaultWidget(title: "privacy_policy".tr, color: ThemeClass.orangeColor,
              fontSize: 20.sp, fontWeight: FontWeight.w500,),],),
            SizedBox(height: 44.h,),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context,index)
                  {
                    return PrivacyPolicyItem(privacyPolicy: profileController.privacyPolicyList[index],);
                  }),
            ),
            SizedBox(height: 44.h,),
          ],
        ),
      ),);
  }
}
