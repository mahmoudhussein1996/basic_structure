import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Theme/theme.dart';
import 'default_text_widget.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextDefaultWidget(
        title: 'bareq'.tr,
        color: ThemeClass.primaryColor,
        fontSize: 48.sp, fontWeight: FontWeight.w400,
        FontFamily: "Baloo"
    );
  }
}
