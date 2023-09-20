import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Theme/theme.dart';
import '../../../Widgets/custom_button_widget.dart';
import '../../../Widgets/custom_textfeild_widget.dart';
import '../../../Widgets/default_text_widget.dart';
import '../Authentication/authentication_controller.dart';
import 'forget_password_controller.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = "/ForgetPasswordScreen";

  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends StateMVC<ForgetPasswordScreen> {
  _ForgetPasswordScreenState() : super(AuthenticationController()) {
    con = AuthenticationController();
  }
  late AuthenticationController con;

  final GlobalKey<FormState> _formKey = GlobalKey();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.loading =false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Stack(
            children: [
              Positioned(
                top: 430.h,
                child:Image.asset("assets/images/forget_password_vec.png",width: 370.w,height: 400.h,fit: BoxFit.scaleDown)),
              Form(
                key: _formKey,
                // autovalidateMode: con.autoValidate
                //     ? AutovalidateMode.always
                //     : AutovalidateMode.disabled,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 36.h),
                        TextDefaultWidget(
                          title: 'forget_pass_title'.tr,
                          fontSize: 20.sp,
                          color: ThemeClass.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 32.h),
                        TextDefaultWidget(
                          title: "forget_desc".tr,
                          fontSize: 14.sp,
                          color: ThemeClass.greyColor,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 92.h),
                        CustomTextFieldWidget(
                          label: "email".tr,
                          hint: "email_hint".tr,
                          hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                          insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                          borderRadiusValue: 16.r,
                          controller: con.forgetPasswordEmailController,
                          validator: (val){
                            val!.trim().isEmpty ?  "email_validation".tr :  "";
                          },
                        ),
                        // SizedBox(height: 20.h,),
                        // Center(
                        //   child: TextDefaultWidget(
                        //     title: "or".tr,
                        //     fontSize: 14.sp,
                        //     color: ThemeClass.greyColor.withOpacity(.58),
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),
                        // SizedBox(height: 20.h,),
                        // CustomTextFieldWidget(
                        //   label: "phone_number".tr,
                        //   hint: "phone_number_hint".tr,
                        //   textInputType: TextInputType.number,
                        //   hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                        //   insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                        //   borderRadiusValue: 16.r,
                        //   validator: (val){
                        //     val!.trim().isEmpty ?  "phone_number_validation".tr :  "";
                        //   },
                        //   onFieldSubmitted: (val)
                        //   {
                        //
                        //   },
                        // ),
                        SizedBox(height: 32.h),
                        CustomButton(
                          title: 'send_email'.tr,
                          radius: 6.r,
                          onTap: () async {
                             con.forgetPassword(context);
                          },
                          backgroundColor: ThemeClass.primaryColor,
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: 60.w,
                  top: 196.h,
                  child: Image.asset("assets/images/email2.png",width: 44.w, height: 30.h, fit: BoxFit.contain)),
              Positioned(
                  right: 50.w,
                  top: 200.h,
                  child: Image.asset("assets/images/email1.png",width: 44.w, height: 30.h, fit: BoxFit.contain))
            ],
          ),
        ),
      ),
    );
  }
}
