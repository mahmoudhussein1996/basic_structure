import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Shared/shared_preferances.dart';
import '../Theme/theme.dart';

class BackButtonWidget extends StatelessWidget {
  Color? iconColor;
   BackButtonWidget(
      {Key? key, this.iconColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).maybePop(),
      child: Icon(SharedPref.getCurrentLang() == 'ar' ? Icons.arrow_forward : Icons.arrow_back, color: iconColor ?? ThemeClass.blackColor,)
    );
  }
}
