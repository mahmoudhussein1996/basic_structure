import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Theme/theme.dart';
import '../../../Utilities/Layout/loading_screen.dart';
import '../../../Widgets/animated_alert_dialog.dart';
import '../../../Widgets/back_button_widget.dart';
import '../../../Widgets/custom_button_widget.dart';
import '../../../Widgets/custom_textfeild_widget.dart';
import '../../../Widgets/default_text_widget.dart';
import 'forget_password_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = "/ResetPasswordScreen";
  const ResetPasswordScreen({Key? key})
      : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends StateMVC<ResetPasswordScreen> {
  _ResetPasswordScreenState() : super(ForgetPasswordController()) {
    con = ForgetPasswordController();
  }
  late ForgetPasswordController con;

  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isPassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // con.phoneController.text = widget.academicInfo.phoneNumber ?? '';
    // con.otpCode = widget.academicInfo.otpCode;
    // print("phone is ya pop::::${widget.academicInfo.phoneNumber}");
    // print("phone is ya pop::::${widget.academicInfo.otpCode}");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: LoadingScreen(
        loading: con.loading,
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset("assets/images/forget_password_vec.png",width: 360.w,fit: BoxFit.cover)),
                Form(
                  key: _formKey,
                  autovalidateMode: con.autoValidate
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 36.h),
                        TextDefaultWidget(
                          title: "new_password".tr,
                          fontSize: 20.sp,
                          color: ThemeClass.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 30.h),
                        TextDefaultWidget(
                          title: "new_password_desc".tr,
                          fontSize: 14.sp,
                          color: ThemeClass.normalgreyColor,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 30.h),
                        TextDefaultWidget(
                          title: "new_password_hint".tr,
                          fontSize: 12.sp,
                          color: ThemeClass.normalgreyColor.withOpacity(.58),
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 55.h),
                        CustomTextFieldWidget(
                          controller: con.passwordController,
                          obscure: isPassword,
                          label: "password".tr,
                          hint: "password".tr,
                          textInputAction: TextInputAction.next,
                          suffixIcon: GestureDetector(
                              onTap: () => setState(() {
                                isPassword = !isPassword;
                              }),
                              child: isPassword == false
                                  ? const Icon(Icons.visibility_rounded)
                                  : const Icon(Icons.visibility_off_rounded)
                          ),
                          validator: (String? v) {
                            if (v == null || v.isEmpty) {
                              return "password_validation".tr;
                            }
                            return null;
                          },
                          onchange: (_) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20.h),
                        CustomTextFieldWidget(
                          controller: con.passwordController,
                          obscure: isPassword,
                          label: "confirm_password".tr,
                          hint: "password".tr,
                          textInputAction: TextInputAction.next,
                          suffixIcon: GestureDetector(
                              onTap: () => setState(() {
                                isPassword = !isPassword;
                              }),
                              child: isPassword == false
                                  ? const Icon(Icons.visibility_rounded)
                                  : const Icon(Icons.visibility_off_rounded)
                          ),
                          validator: (String? v) {
                            if (v == null || v.isEmpty) {
                              return "password_validation".tr;
                            }
                            return null;
                          },
                          onchange: (_) {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 60.h),
                        CustomButton(
                          title: "reset_password".tr,
                          radius: 6.r,
                          backgroundColor: ThemeClass.primaryColor,
                          onTap: () async {
                            if ((_formKey.currentState?.validate() ?? false) &&
                                con.passwordController.text.length >= 7) {
                              print('sgdgddfff');
                              await con.resetPassword(context);
                            } else {
                              print('nnnnnnnnnnnnnnn');
                              setState(() {
                                con.autoValidate = true;
                              });
                            }
                          },
                        ),
                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}
