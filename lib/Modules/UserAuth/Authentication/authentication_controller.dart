import 'package:bareq/Modules/FreeLessons/free_lesson_screen.dart';
import 'package:bareq/Modules/Home/main_screen.dart';
import 'package:bareq/Modules/UserAuth/Authentication/authentication_screen.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Utilities/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../API/user_api.dart';
import '../../SplashScreen/splash_screen.dart';

class AuthenticationController extends ControllerMVC
{
  factory AuthenticationController() {
    _this ??= AuthenticationController._();
    return _this!;
  }

  static AuthenticationController? _this;
  AuthenticationController._();

  bool loading = false, rememberMe= false, acceptTerms = false;
  late List<String> timeZones;

   TextEditingController loginEmailController = TextEditingController();
   TextEditingController loginPasswordController = TextEditingController();
   TextEditingController registerPasswordController = TextEditingController();
   TextEditingController registerEmailController = TextEditingController();
   TextEditingController registerNameController = TextEditingController();
   TextEditingController registerPhoneController = TextEditingController();
   TextEditingController registerBirthDateController = TextEditingController();
   TextEditingController registerCountryController = TextEditingController();
   TextEditingController forgetPasswordEmailController = TextEditingController();
   bool passwordVisisble = true;
   int role = 2;

  @override
  void dispose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    registerPasswordController.dispose();
    registerEmailController.dispose();
    registerNameController.dispose();
    registerPhoneController.dispose();
    registerBirthDateController.dispose();
    registerCountryController.dispose();
    super.dispose();
  }
  
  Future login(BuildContext context)
  async {
    setState(() {
      loading = true;
    });
    
    bool result = await UserApi.login(email: loginEmailController.text,
        password: loginPasswordController.text, rememberMe: rememberMe,);
    
    if(result == true)
      {
        ToastHelper.showSuccess(message: "login_success".tr);
        Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName, (_)=> false);

        setState(() {
          loading = false;
        });
      }

  }

  Future register(BuildContext context)
  async {
    setState(() {
      loading = true;
    });

    bool result = await UserApi.register(name: registerNameController.text,
        email: registerEmailController.text, password: registerPasswordController.text,
        phone: registerPhoneController.text, birthDate: registerBirthDateController.text,
        country: registerCountryController.text);

    if(result == true)
    {
      Navigator.pushNamed(context, AuthenticationScreen.routeName, arguments: 0);
    }

    setState(() {
      loading = false;
    });
  }

  Future forgetPassword(BuildContext context)
  async {
    setState(() {
      loading = true;
    });

    bool result = await UserApi.forgetPasssword(email: forgetPasswordEmailController.text);

    if(result == true)
    {
      ToastHelper.showSuccess(message: "check_passord_message".tr);
      Navigator.pushNamed(context, AuthenticationScreen.routeName, arguments: 0);
    }

    setState(() {
      loading = false;
    });
  }

}