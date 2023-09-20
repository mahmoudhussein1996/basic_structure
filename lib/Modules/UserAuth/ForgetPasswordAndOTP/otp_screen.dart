import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../../Theme/theme.dart';
import '../../../Utilities/Layout/loading_screen.dart';
import '../../../Utilities/toast_helper.dart';
import '../../../Widgets/back_button_widget.dart';
import '../../../Widgets/custom_button_widget.dart';
import '../../../Widgets/default_text_widget.dart';
import '../../../Widgets/pin_code.dart';
import 'otp_controller.dart';

class OtpScreen extends StatefulWidget {
  static String routeName = "/otpScreen";

  // final Function(String)? onConfirm;
  // final String phone;

   OtpScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends StateMVC<OtpScreen> {
  _OtpScreenState() : super(OtpController()) {
    con = OtpController();
  }

  late OtpController con;

  @override
  void initState() {
    con.activeResend = false;
    // con.onConfirm = widget.onConfirm;
    // con.phoneNumber = widget.phone;
    super.initState();
    print('phoneNumber ya pop::::::   ${con.phoneNumber}');

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    con.loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      loading: con.loading,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          // appBar: CustomAppBar.classicAppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Form(
                  key: con.formKey,
                  autovalidateMode: con.autoValidate
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: SingleChildScrollView(
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
                          title: "opt_desc".tr,
                          fontSize: 12.sp,
                          color: ThemeClass.greyColor,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 86.h),
                        PinCodeWidget(controller: con.otpCodeController,),
                        SizedBox(height: 18.h),
                        Center(
                          child: TextDefaultWidget(
                            title: "resend_code".tr,
                            fontSize: 16.sp,
                            color: ThemeClass.greyColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 70.h),
                        CustomButton(
                          title: "reset_password".tr,
                          radius: 6.r,
                          backgroundColor: ThemeClass.primaryColor,
                          onTap: () async {
                            if (con.formKey.currentState?.validate() ?? false) {
                              // widget.academicInfo.otpCode=con.otpCodeController.text;
                              // await con.checkOtpToResetPassword();
                              // widget.academicInfo.
                              // await con.AcademicInfo();
                            } else {
                             // ToastHelper.showError(message: "otp_error".tr);
                            }
                          },
                        ),
                        // SizedBox(height: 28.h),
                        // FadeIn(
                        //   delay: 2,
                        //   from: SlideFrom.BOTTOM,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       InkWell(
                        //         onTap: () async{
                        //           if (con.activeResend == true) {
                        //         // await    con.onResendCode();
                        //           }
                        //         },
                        //         child: TextDefaultWidget(
                        //             title: "resend_otp".tr,
                        //             fontWeight: con.activeResend
                        //                 ? FontWeight.w400
                        //                 : FontWeight.w200,
                        //             fontSize: con.activeResend ? 14.sp : 12.sp,
                        //             color: con.activeResend
                        //                 ? ThemeClass.blackColor
                        //                 : ThemeClass.greyColor),
                        //       ),
                        //       if (con.start != 0)
                        //         TextDefaultWidget(
                        //             title: "00:${con.start}",
                        //             fontWeight: FontWeight.w600,
                        //             fontSize: 14.sp,
                        //             color: ThemeClass.blackColor),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 100.h,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget confirmChangePassword() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.all(38.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 45.h),
                  Image.asset(
                    "assets/images/auth/success_icon.png",
                    width: 100.w,
                    height: 100.h,
                  ),
                  SizedBox(height: 24.h),
                  TextDefaultWidget(
                      title: "welcome".tr,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: ThemeClass.yellowColor),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextDefaultWidget(
                          title: "welcome_message".tr,
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: ThemeClass.blackColor),
                      Image.asset(
                        "assets/images/auth/smile.png",
                        width: 30.w,
                        height: 30.h,
                      )
                    ],
                  ),
                  SizedBox(height: 40.h),
                  GestureDetector(
                    onTap: () {
                      // Modular.to.pushNamedAndRemoveUntil(MainScreen.routeName,
                      //     (Route<dynamic> route) => false);
                    },
                    child: Container(
                      width: 200.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: ThemeClass.blackColor,
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      alignment: Alignment.center,
                      child: TextDefaultWidget(
                        title: "main_screen".tr,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                        color: ThemeClass.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
