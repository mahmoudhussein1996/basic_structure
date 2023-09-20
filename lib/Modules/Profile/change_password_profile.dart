import 'package:bareq/Modules/Profile/profile_controller.dart';
import 'package:bareq/Modules/Profile/profile_widget/profile_definition_widget.dart';
import 'package:bareq/Widgets/back_button_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import '../../Utilities/Layout/helper.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/custom_textfeild_widget.dart';


class ChangePasswordProfileScreen extends StatefulWidget {
  ChangePasswordProfileScreen({Key? key}) : super(key: key);

  static const String routeName = "/ChangePasswordProfileScreen";

  @override
  _ChangePasswordProfileScreenState createState() => _ChangePasswordProfileScreenState();
}

class _ChangePasswordProfileScreenState extends StateMVC<ChangePasswordProfileScreen> {

  _ChangePasswordProfileScreenState() : super(ProfileController()) {
    con = ProfileController();
  }
  late ProfileController con;

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              SizedBox(height: 28.h,),
              ProfileDefinitionWidget(profileTitle: con.user!.name),
              SizedBox(height: 16.h,),
              Row(children: [SvgPicture.asset("assets/images/unlock.svg"), SizedBox(width: 18.w,), TextDefaultWidget(title: "change_password".tr, color: ThemeClass.orangeColor,
                fontSize: 20.sp, fontWeight: FontWeight.w500,),],),
              SizedBox(height: 28.h,),
              CustomTextFieldWidget(
                label: "current_password".tr,
                hint: "password_hint".tr,
                hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                borderRadiusValue: 16.r,
                obscure:con.oldPasswordVisible,
                controller: con.oldPasswordController,
                suffixIcon: InkWell(onTap:(){
                  setState(() {
                    con.oldPasswordVisible = !con.oldPasswordVisible;
                  });
                },child: Icon(con.oldPasswordVisible ? Icons.visibility : Icons.visibility_off, color: ThemeClass.normalgreyColor,)),
                validator: (val){
                  val!.trim().isEmpty ?  "password_validation".tr :  "";
                },
              ),
              SizedBox(height: 10.h,),
              CustomTextFieldWidget(
                label: "new_password".tr,
                hint: "password_hint".tr,
                controller: con.passwordController,
                hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                borderRadiusValue: 16.r,
                obscure:con.newPasswordVisible,
                suffixIcon: InkWell(onTap:(){
                    setState(() {
                      con.newPasswordVisible = !con.newPasswordVisible;
                    });
                  },child: Icon(con.newPasswordVisible ? Icons.visibility : Icons.visibility_off, color: ThemeClass.normalgreyColor,)),
                validator: (val){
                  val!.trim().isEmpty ?  "password_validation".tr :  "";
                },
              ),
              SizedBox(height: 3.h,),
              TextDefaultWidget(title: "password_hint_desc".tr, fontSize: 12.sp,
                fontWeight: FontWeight.w400, color: ThemeClass.normalgreyColor.withOpacity(.58),),
              SizedBox(height: 10.h,),
              CustomTextFieldWidget(
                label: "confirm_password".tr,
                hint: "password_hint".tr,
                controller: con.confirmPasswordController,
                hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                borderRadiusValue: 16.r,
                obscure:con.confirmNewPasswordVisible,
                suffixIcon: InkWell(onTap:(){
                  setState(() {
                    con.confirmNewPasswordVisible = !con.confirmNewPasswordVisible;
                  });
                },child: Icon(con.confirmNewPasswordVisible ? Icons.visibility : Icons.visibility_off, color: ThemeClass.normalgreyColor,)),
                validator: (val){
                  val!.trim().isEmpty ?  "password_validation".tr :  "";
                },
              ),
              SizedBox(height: 40.h,),
              CustomButton(title: "save_changes".tr, radius: 6.r,backgroundColor: ThemeClass.primaryColor,onTap: (){
                con.changePassword(context);
              }),
              SizedBox(height: 20.h,),
              CustomButton(title: "cancel".tr, radius: 6.r,textColor: ThemeClass.primaryColor,borderColor: ThemeClass.primaryColor,onTap: (){
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),);
  }
}
