import 'package:bareq/Modules/Home/home_screen.dart';
import 'package:bareq/Modules/Home/main_screen.dart';
import 'package:bareq/Modules/Units/units_screen.dart';
import 'package:bareq/Modules/Profile/frequently_asked_questions_profile_screen.dart';
import 'package:bareq/Modules/Profile/about_Screen.dart';
import 'package:bareq/Modules/Profile/change_password_profile.dart';
import 'package:bareq/Modules/Profile/edit_location_profile_screen.dart';
import 'package:bareq/Modules/Profile/edit_profile_screen.dart';
import 'package:bareq/Modules/Profile/logout_screen.dart';
import 'package:bareq/Modules/Profile/privacy_policy_screen.dart';
import 'package:bareq/Modules/Profile/profile_screen.dart';
import 'package:bareq/Modules/UserAuth/ForgetPasswordAndOTP/updated_password_screen.dart';
import 'package:bareq/Modules/test_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../Modules/FreeLessons/free_lesson_screen.dart';
import '../Modules/OnboardingScreens/onboaring_screen.dart';
import '../Modules/Profile/contact_us_screen.dart';
import '../Modules/Profile/subscription_profile_screen.dart';
import '../Modules/SplashScreen/splash_screen.dart';
import '../Modules/UserAuth/Authentication/authentication_screen.dart';
import '../Modules/UserAuth/Authentication/register_success_screen.dart';
import '../Modules/UserAuth/ForgetPasswordAndOTP/forget_password_screen.dart';
import '../Modules/UserAuth/ForgetPasswordAndOTP/otp_screen.dart';
import '../Modules/UserAuth/ForgetPasswordAndOTP/reset_password_screen.dart';
import '../Modules/UserAuth/RegisterType/register_type_screen.dart';
import '../Modules/html_test_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(OnBoardingScreen.routeName,
        child: (_, args) => const OnBoardingScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(ForgetPasswordScreen.routeName,
        child: (_, args) => const ForgetPasswordScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(OtpScreen.routeName,
        child: (_, args) => OtpScreen(
            //academicInfo: args.data
            // phone: args.data[0],
            // onConfirm: args.data[1] ?? () {},
            ),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(ResetPasswordScreen.routeName,
        child: (_, args) => ResetPasswordScreen(
            //academicInfo: args.data
            ),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(SplashScreen.routeName,
        child: (_, args) => const SplashScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(AuthenticationScreen.routeName,
        child: (_, args) => AuthenticationScreen(
              currentIndex: args.data,
            ),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(UpdatedPasswordScreen.routeName,
        child: (_, args) => const UpdatedPasswordScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(RegisterSuccessScreen.routeName,
        child: (_, args) => const RegisterSuccessScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(ProfileScreen.routeName,
        child: (_, args) =>  ProfileScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(HomeScreen.routeName,
        child: (_, args) =>  const HomeScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(MainScreen.routeName,
        child: (_, args) =>   MainScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(EditProfileScreen.routeName,
        child: (_, args) =>  EditProfileScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(EditLocationProfileScreen.routeName,
        child: (_, args) =>  EditLocationProfileScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(ChangePasswordProfileScreen.routeName,
        child: (_, args) =>  ChangePasswordProfileScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(SubscriptionProfileScreen.routeName,
        child: (_, args) =>  SubscriptionProfileScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(FrequentlyAskedQuestionsProfileScreen.routeName,
        child: (_, args) =>  FrequentlyAskedQuestionsProfileScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(PrivacyPolicyScreen.routeName,
        child: (_, args) =>  PrivacyPolicyScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(ContactUsScreen.routeName,
        child: (_, args) =>  ContactUsScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(AboutScreen.routeName,
        child: (_, args) =>  AboutScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(LogoutScreen.routeName,
        child: (_, args) =>  LogoutScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(FreeLessonScreen.routeName,
        child: (_, args) =>  FreeLessonScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(HtmlTestScreen.routeName,
        child: (_, args) =>  HtmlTestScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

    ChildRoute(TestScreen.routeName,
        child: (_, args) =>  TestScreen(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

  ];

  static ChildRoute defaultRoute(
      {required String routeName, required Widget child}) {
    return ChildRoute(routeName,
        child: (_, args) => child,
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300));
  }
}
