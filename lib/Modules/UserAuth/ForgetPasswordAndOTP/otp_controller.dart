import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class OtpController extends ControllerMVC {
  // singleton
  factory OtpController() {
    _this ??= OtpController._();
    return _this!;
  }

  static OtpController? _this;

  OtpController._();

  final GlobalKey<FormState> formKey = GlobalKey();

  late TextEditingController otpCodeController;
  bool loading = false,
      autoValidate = false,
      showConfirmPassword = true,
      activeResend = false,
      showPassword = true;
  String? phoneNumber;

  Function(String)? onConfirm;

  @override
  void initState() {
    otpCodeController = TextEditingController();
    startTimer();
    activeResend = false;
    start = 3;
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Timer? timer;
  int start = 10;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
            activeResend = true;
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  // Future checkOtpToResetPassword()async{
  //   setState(() {
  //     loading = true;
  //   });
  //   bool result = await UserApi.checkOtpToResetPassword(phone: phoneNumber??'', otpCode: otpCodeController.text);
  //   if(result ==true) {
  //     Modular.to.pushNamed(ResetPasswordScreen.routeName, arguments: academicInfo ?? AcademicInfo(phoneNumber: phoneNumber,otpCode: otpCodeController.text));
  //   }
  //
  //   setState(() {
  //     loading = false;
  //   });
  // }
  // Future onResendCode() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   bool result = await UserApi.resendOtpForForgotPass(phone: phoneNumber??'');
  //   if(result ==true) {
  //     activeResend = false;
  //     start = 1;
  //     startTimer();
  //   }
  //
  //   setState(() {
  //     loading = false;
  //   });
  // }

  // Future sendOtp(BuildContext context) async {
  //   setState(() {
  //     loading = true;
  //   });
  //   bool result = await UserApi.sendOtp(
  //       phone: phoneNumber ?? '', code: codeController.text);
  //   setState(() {
  //     loading = false;
  //   });
  //   if (result)
  //     Navigator.pushNamed(
  //       context,
  //       MainScreen.routeName,
  //     );
  // }

  // Future onConfirmPin() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   debugPrint('otp code ya pop: ${otpCodeController.text}');
  //   Modular.to.pushNamed(ResetPasswordScreen.routeName);
  //   if (onConfirm != null) {
  //     await onConfirm!(otpCodeController.text);
  //   }
  //   setState(() {
  //     loading = false;
  //   });
  // }
}


