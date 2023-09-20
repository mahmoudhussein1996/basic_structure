import 'package:bareq/Modules/Profile/profile_controller.dart';
import 'package:bareq/Theme/theme.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Models/setting_Item_model.dart';

class ProfileListItemWidget extends StatelessWidget {
  SettingItem settingItem;

   ProfileListItemWidget({Key? key, required this.settingItem}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:EdgeInsets.symmetric(horizontal: 26.w),
          height: .5.h, color: ThemeClass.normalgreyColor,width: double.infinity,),
        ListTile(title: TextDefaultWidget(title: settingItem.title, fontSize: 14.sp, fontWeight: FontWeight.w500, color: ThemeClass.mediumgreyColor,),
         leading: SvgPicture.asset(settingItem.image, width: 24.w, height: 24.h,
         fit: BoxFit.scaleDown, color: ThemeClass.normalgreyColor,),
         trailing: Icon(Icons.arrow_forward_ios, size: 20, color: ThemeClass.normalgreyColor,),)
      ],
    );
  }
}
