import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Models/privacy_policy_model.dart';
import '../../../Theme/theme.dart';
import '../../../Widgets/default_text_widget.dart';

class PrivacyPolicyItem extends StatelessWidget {

  PrivacyPolicy privacyPolicy;

   PrivacyPolicyItem({Key? key, required this.privacyPolicy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextDefaultWidget(title: privacyPolicy.title,
          fontSize: 12.sp, fontWeight: FontWeight.w600, color: ThemeClass.primaryColor,),
        SizedBox(height: 8.h,),
        TextDefaultWidget(title: privacyPolicy.content,
          fontSize: 10.sp,maxLines:  40,fontWeight: FontWeight.w400, color: ThemeClass.mediumgreyColor,),
        SizedBox(height: 20.h,),
      ],
    );
  }
}
