import 'package:bareq/Modules/Packages/packages_controller.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Widgets/custom_button_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Theme/theme.dart';
class PackageWidget extends StatefulWidget {
  const PackageWidget({Key? key}) : super(key: key);

  @override
  State<PackageWidget> createState() => _PackageWidgetState();
}

class _PackageWidgetState extends State<PackageWidget> {
  late PackagesController con;

  @override
  void initState() {
    con = PackagesController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 44.h,),
          TextDefaultWidget(title: "1 month", fontSize: 14.sp, fontWeight: FontWeight.w600,
            color: ThemeClass.normalgreyColor,),
          SizedBox(height: 4.h,),
          TextDefaultWidget(title: "10" "\$", fontSize: 32.sp, fontWeight: FontWeight.w600,
            color: ThemeClass.primaryColor,),
          CustomButton(title: "select_plan".tr, textColor: con.planSelected ? ThemeClass.mediumgreyColor : ThemeClass.whiteColor ,
          backgroundColor: con.planSelected ? ThemeClass.whiteColor : ThemeClass.primaryColor,onTap: (){})
        ],
      ),
    );
  }
}
