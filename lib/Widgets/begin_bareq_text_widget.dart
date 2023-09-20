import 'package:bareq/Theme/theme.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BeginBareqText extends StatelessWidget {
  const BeginBareqText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextDefaultWidget(
      title: "begin_in_barq".tr,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: ThemeClass.mediumgreyColor,
    );
  }
}
