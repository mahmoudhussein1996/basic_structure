import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ForgetPasswordController extends ControllerMVC {
  // singleton
  factory ForgetPasswordController() {
    _this ??= ForgetPasswordController._();
    return _this!;
  }

  static ForgetPasswordController? _this;
  ForgetPasswordController._();

  bool loading = false, autoValidate = false;
String? otpCode;
  late TextEditingController userNameController,
      passwordController,
      confirmPasswordController,
      phoneController;

  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future sendOtpForForgotPass(BuildContext context) async {
    setState(() {
      loading = true;
    });
    // bool result = await UserApi.sendOtpForForgotPass(phone: phoneController.text);
    // if(result ==true) {
    //   Navigator.of(context).pushNamed(
    //   OtpScreen.routeName,
    //   arguments: AcademicInfo(phoneNumber: phoneController.text),
    // );
    // }

    setState(() {
      loading = false;
    });
  }
  Future resetPassword(BuildContext context) async {
    setState(() {
      loading = true;
    });
    // bool result = await UserApi.resetPassword(phone: phoneController.text, otp: otpCode??'', password:passwordController.text, passwordConfirmation: confirmPasswordController.text);
    // if(result ==true) {
    //   animatedAlertDialog(
    //       context, ConfirmPasswordResetBottomSheet());
    //
    // }
    //
    // setState(() {
    //   loading = false;
    // });
  }

}
