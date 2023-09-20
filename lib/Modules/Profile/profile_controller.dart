import 'package:bareq/Models/frequently_asked_questions_model.dart';
import 'package:bareq/Models/privacy_policy_model.dart';
import 'package:bareq/Modules/Home/main_screen.dart';
import 'package:bareq/Modules/UserAuth/Authentication/authentication_screen.dart';
import 'package:bareq/Shared/shared_preferances.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../API/user_api.dart';
import '../../Models/setting_Item_model.dart';
import '../../Models/user_model.dart';
import '../../Utilities/consts.dart';
import '../../Utilities/toast_helper.dart';


class ProfileController extends ControllerMVC {
  factory ProfileController() {
    _this ??= ProfileController._();
    return _this!;
  }
  static ProfileController? _this;

  ProfileController._();

  List<PrivacyPolicy> privacyPolicyList = [
    PrivacyPolicy(title: Consts.privacyPolicyTitle1, content: Consts.privacyPolicyContent1),
    PrivacyPolicy(title: Consts.privacyPolicyTitle2, content: Consts.privacyPolicyContent2),
    PrivacyPolicy(title: Consts.privacyPolicyTitle3, content: Consts.privacyPolicyContent3),
    PrivacyPolicy(title: Consts.privacyPolicyTitle4, content: Consts.privacyPolicyContent4),
    PrivacyPolicy(title: Consts.privacyPolicyTitle5, content: Consts.privacyPolicyContent5),
  ];

  List<FrequentlyAskedQuestions> frequencyAskedQuestionsList = [
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion1, answer: Consts.frequencyAnswer1),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion2, answer: Consts.frequencyAnswer2),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion3, answer: Consts.frequencyAnswer3),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion4, answer: Consts.frequencyAnswer4),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion5, answer: Consts.frequencyAnswer5),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion6, answer: Consts.frequencyAnswer6),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion7, answer: Consts.frequencyAnswer7),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion8, answer: Consts.frequencyAnswer8),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion9, answer: Consts.frequencyAnswer9),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion10, answer: Consts.frequencyAnswer10),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion11, answer: Consts.frequencyAnswer11),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion12, answer: Consts.frequencyAnswer12),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion13, answer: Consts.frequencyAnswer13),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion14, answer: Consts.frequencyAnswer14),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion15, answer: Consts.frequencyAnswer15),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion16, answer: Consts.frequencyAnswer16),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion17, answer: Consts.frequencyAnswer17),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion18, answer: Consts.frequencyAnswer18),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion19, answer: Consts.frequencyAnswer19),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion20, answer: Consts.frequencyAnswer20),
    FrequentlyAskedQuestions(question: Consts.frequencyQuestion21, answer: Consts.frequencyAnswer21),
  ];

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  bool loading = false;
  bool oldPasswordVisible = true;
  bool newPasswordVisible = true;
  bool confirmNewPasswordVisible = true;
  late List<String> timeZones;
  late User user;

  List<SettingItem> settings = [
    SettingItem(id: 1, title: "my_information".tr, image: "assets/images/user.svg"),
    SettingItem(id: 2, title: "location".tr, image: "assets/images/location.svg"),
    SettingItem(id: 3, title: "subscription".tr, image: "assets/images/subscription.svg"),
    SettingItem(id: 4, title: "change_password".tr, image: "assets/images/unlock.svg"),
    SettingItem(id: 5, title: "faq".tr, image: "assets/images/message-question.svg"),
    SettingItem(id: 6, title: "about".tr, image: "assets/images/info.svg"),
    SettingItem(id: 7, title: "contact_us".tr, image: "assets/images/contact_us.svg"),
    SettingItem(id: 8, title: "privacy_policy".tr, image: "assets/images/privacy.svg"),
    SettingItem(id: 9, title: "logout".tr, image: "assets/images/privacy.svg"),
  ];

  @override
  void initState() {
    user = SharedPref.getUserObg();
    super.initState();
  }
  Future logOut(BuildContext context) async {
    setState(() {
      loading = true;
    });
    bool result = await UserApi.logout(user.token);
    if(result == true)
    {
      setState(() {
        loading = false;
      });
      Navigator.of(context).pushReplacementNamed(
          AuthenticationScreen.routeName, arguments: 0);
    }
  }

  Future changePassword(BuildContext context) async
  {
    setState(() {
      loading = true;
    });

    bool result = await UserApi.changePasssword(oldpassword: oldPasswordController.text,
        newPassword: passwordController.text, confirmNewPassword: confirmPasswordController.text, token: user.token);

    if(result == true)
    {
      // ToastHelper.showSuccess(message: "login_success".tr);
      Navigator.pushNamed(context, AuthenticationScreen.routeName, arguments: 0);

      setState(() {
        loading = false;
      });
    }
  }

  Future updateUserData(BuildContext context) async
  {
    setState(() {
      loading = true;
    });

    bool result = await UserApi.updateUserData(token: user.token, name: nameController.text, email: emailController.text,
    phone: phoneController.text, birthDate: dateOfBirthController.text, id: user.id);

    if(result == true)
    {
      Navigator.pushNamed(context, AuthenticationScreen.routeName, arguments: 0);

      setState(() {
        loading = false;
      });
    }
  }

  Future contactUs(BuildContext context) async
  {
    setState(() {
      loading = true;
    });

    bool result = await UserApi.contactUs(name: user.name, email: user.email,
    subject: subjectController.text, content: contentController.text);

    if(result == true)
    {
      Navigator.pushNamed(context, MainScreen.routeName);

      setState(() {
        loading = false;
      });
    }
  }

  Future updateUserLocation(BuildContext context) async
  {
    setState(() {
      loading = true;
    });

    bool result = await UserApi.updateUserLocation(token: user.token, timeZone: locationController.text);

    if(result == true)
    {
      Navigator.pushNamed(context, MainScreen.routeName);

      setState(() {
        loading = false;
      });
    }
  }
}
