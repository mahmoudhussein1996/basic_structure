import 'package:bareq/Modules/Profile/profile_controller.dart';
import 'package:bareq/Modules/Profile/profile_widget/profile_definition_widget.dart';
import 'package:bareq/Widgets/back_button_widget.dart';
import 'package:bareq/Widgets/custom_dropdown_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import '../../Utilities/Layout/helper.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/custom_textfeild_widget.dart';


class EditLocationProfileScreen extends StatefulWidget {
  EditLocationProfileScreen({Key? key}) : super(key: key);

  static const String routeName = "/EditLocationProfileScreen";

  @override
  _EditLocationProfileScreenState createState() => _EditLocationProfileScreenState();
}

class _EditLocationProfileScreenState extends StateMVC<EditLocationProfileScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();

  _EditLocationProfileScreenState() : super(ProfileController()) {
    con = ProfileController();
  }
  late ProfileController con;

  @override
  void initState() {
    con.timeZones = Helper.getTimeZones();
    super.initState();
  }
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              SizedBox(height: 28.h,),
              ProfileDefinitionWidget(profileTitle: con.user!.name),  SizedBox(height: 16.h,),
              Row(children: [SvgPicture.asset("assets/images/subscription.svg"), SizedBox(width: 18.w,), TextDefaultWidget(title: "location".tr, color: ThemeClass.orangeColor,
                fontSize: 20.sp, fontWeight: FontWeight.w500,),],),
              SizedBox(height: 24.h,),
              CustomDropDownWidget(onChange: (value){
                setState(() {
                  con.locationController.text = value;
                });
              },selectedValue: con.user.country == "" ? con.timeZones.first : con.user.country,label: "select_country".tr,
              items: con.timeZones.map((e) => DropdownMenuItem(value: e,
                child: TextDefaultWidget(title: e.toString(), color: ThemeClass.blackColor, fontSize: 10.sp, fontWeight: FontWeight.w500,),)).toList()),

              // CustomTextFieldWidget(
              //   label: "select_country".tr,
              //   hint: "select_country_hint".tr,
              //   readOnly: true,
              //   hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
              //   borderRadiusValue: 16.r,
              //   suffixIcon: Icon(Icons.keyboard_arrow_down, color: ThemeClass.normalgreyColor,),
              //   validator: (val){
              //     if(val!.trim().isEmpty)
              //     {
              //       return "select_country_validation".tr;
              //     }
              //     else
              //     {
              //       return null;
              //     }
              //   },
              // ),
              //SizedBox(height: 20.h,),
              // CustomTextFieldWidget(
              //   label: "select_city".tr,
              //   hint: "select_city_hint".tr,
              //   readOnly: true,
              //   hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
              //   borderRadiusValue: 16.r,
              //   suffixIcon: Icon(Icons.keyboard_arrow_down, color: ThemeClass.normalgreyColor,),
              //   validator: (val){
              //     val!.trim().isEmpty ?  "select_city_validation".tr :  "";
              //   },
              // ),
              SizedBox(height: 100.h,),
              CustomButton(title: "save_changes".tr, radius: 6.r,backgroundColor: ThemeClass.primaryColor,
              onTap: () async {
                if(_formKey.currentState!.validate())
                {
                  setState(() {
                    con.loading = true;
                  });
                 await con.updateUserLocation(context);
                  setState(() {
                    con.loading = false;
                  });
                }
              }),
              SizedBox(height: 20.h,),
              CustomButton(title: "cancel".tr, radius: 6.r,textColor: ThemeClass.primaryColor,borderColor: ThemeClass.primaryColor,onTap: (){})

            ],
          ),
        ),
      ),);
  }
}
