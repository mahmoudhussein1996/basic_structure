import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Widgets/custom_button_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:bareq/Widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Theme/theme.dart';
import '../../Widgets/app_title_widget.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({Key? key}) : super(key: key);

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children:[
            const Center(child: AppTitleWidget()),
            SizedBox(height: 16.h,),
            // custom text widget
            TextDefaultWidget(title: "packages_desc".tr,
              fontSize: 16.sp, fontWeight: FontWeight.w400, color: ThemeClass.blackColor,),
            SizedBox(height: 44.h,),
            Wrap(children: [

            ],),
            SizedBox(height: 62.h,),
            // custom button widget
            CustomButton(title: "", radius: 6.r ,backgroundColor: ThemeClass.primaryColor,onTap: (){}),
            SizedBox(height: 34.h,),
            const DividerWidget(),
            SizedBox(height: 8.h,),
          ],
        ),
      ),
    );
  }
}
