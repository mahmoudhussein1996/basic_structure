import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Theme/theme.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 72.w,
      height: 2.h,
      decoration: BoxDecoration(
          color: ThemeClass.blackColor,
          borderRadius: BorderRadius.circular(8.r)),
    );
  }
}
