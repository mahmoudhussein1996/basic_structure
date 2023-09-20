import 'package:bareq/API/user_api.dart';
import 'package:bareq/Modules/FreeLessons/free_lesson_screen.dart';
import 'package:bareq/Modules/UserAuth/ForgetPasswordAndOTP/forget_password_screen.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Utilities/Layout/loading_screen.dart';
import 'package:bareq/Widgets/custom_button_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Theme/theme.dart';
import '../../../../Widgets/custom_textfeild_widget.dart';
import '../authentication_controller.dart';

class SignInWidget extends StatefulWidget {
  AuthenticationController controller;

   SignInWidget({Key? key, required this.controller}) : super(key: key);

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {

  //AuthenticationController con = AuthenticationController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: LoadingScreen(
          loading: widget.controller.loading,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:[
                SizedBox(height: 32.h,),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          // if(widget.controller.role == 3) {
                          //   setState(() {
                          //     widget.controller.role == 2;
                          //   });
                          // }
                        },
                        child: Container(
                          height: 144.h,
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(color: widget.controller.role == 2 ? Colors.transparent : ThemeClass.primaryColor),
                            color: widget.controller.role == 2 ?  ThemeClass.primaryColor: ThemeClass.whiteColor,),
                          child: Stack(children: [
                            TextDefaultWidget(title: "continue_as_student".tr, fontSize: 20.sp, fontWeight: FontWeight.w500,
                              color: widget.controller.role == 2 ? ThemeClass.whiteColor : ThemeClass.primaryColor,),
                            Positioned(right:4.w, bottom: 2.h ,child: Image.asset("assets/images/student.png", width: 38.w, height: 90.h,))
                          ],),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w,),
                    Expanded(child: InkWell(
                      onTap: (){
                        // if(widget.controller.role == 2) {
                        //   setState(() {
                        //     widget.controller.role == 3;
                        //   });
                        // }
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        height: 144.h,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(color: widget.controller.role == 3 ? Colors.transparent : ThemeClass.primaryColor),
                          color: widget.controller.role == 3 ?  ThemeClass.primaryColor: ThemeClass.whiteColor,),
                        child: Stack(children: [
                          TextDefaultWidget(title: "continue_as_parent".tr, fontSize: 20.sp, fontWeight: FontWeight.w500,
                            color: widget.controller.role == 3 ? ThemeClass.whiteColor : ThemeClass.primaryColor,),
                          Positioned(
                              bottom: 2.h, right: 4.w,
                              child: Image.asset("assets/images/parent.png", width: 68.w, height: 50.h,))
                        ],),
                      ),
                    )),
                  ],
                ),
                SizedBox(height: 32.h,),
                CustomTextFieldWidget(
                  label: "email".tr,
                  hint: "email_hint".tr,
                  controller: widget.controller.loginEmailController,
                  hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                  insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                  borderRadiusValue: 16.r,
                  validator: (val){
                    if(val!.trim().isEmpty)
                    {
                      return "email_validation".tr;
                    }
                    else
                    {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 32.h,),
                CustomTextFieldWidget(
                  label: "password".tr,
                  hint: "password_hint".tr,
                  hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                  borderRadiusValue: 16.r,
                  obscure: widget.controller.passwordVisisble,
                  controller: widget.controller.loginPasswordController,
                  suffixIcon: InkWell(onTap:(){
                    setState(() {
                      widget.controller.passwordVisisble = ! widget.controller.passwordVisisble;
                    });
                  },child: Icon(widget.controller.passwordVisisble ? Icons.visibility : Icons.visibility_off, color: ThemeClass.normalgreyColor,)),
                  validator: (val){
                    if(val!.trim().isEmpty)
                    {
                      return "username_required".tr;
                    }
                    else
                    {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20.h,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                  },
                  child: TextDefaultWidget(title: "forget_pass".tr,color: ThemeClass.normalgreyColor.withOpacity(.58),fontSize: 16.sp,
                  fontWeight: FontWeight.w600,),
                ),
                SizedBox(height: 28.h,),
                Row(children: [
                  SizedBox(width: 32.w,),
                  Checkbox(value: widget.controller.rememberMe, onChanged: (val){
                    setState(() {
                      widget.controller.rememberMe = val!;
                    });
                  }),
                  SizedBox(width: 8.w,),
                  TextDefaultWidget(title: "remember_me".tr, color: ThemeClass.mediumgreyColor,
                    fontWeight: FontWeight.w500, fontSize: 10.sp,)
                ],),
                SizedBox(height: 35.h,),
                CustomButton(title: "sign_in".tr, radius: 6.r,backgroundColor: ThemeClass.primaryColor,
                onTap: ()  async {

                 if(_formKey.currentState!.validate())
                 {
                   setState(() {
                     widget.controller.loading = true;
                   });

                   await widget.controller.login(context);

                   setState(() {
                     widget.controller.loading = false;
                   });
                 }
                }),
                SizedBox(height: 16.h,),
                CustomButton(title: "explore_free_lesson".tr, radius: 6.r,textColor: ThemeClass.primaryColor,borderColor: ThemeClass.primaryColor,onTap: (){
                  Navigator.pushNamed(context, FreeLessonScreen.routeName);
                })
              ]
            ),
          ),
        ),
      ),
    );
  }
}
