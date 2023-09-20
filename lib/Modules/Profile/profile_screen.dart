import 'package:bareq/Modules/Profile/frequently_asked_questions_profile_screen.dart';
import 'package:bareq/Modules/Profile/about_Screen.dart';
import 'package:bareq/Modules/Profile/change_password_profile.dart';
import 'package:bareq/Modules/Profile/contact_us_screen.dart';
import 'package:bareq/Modules/Profile/edit_location_profile_screen.dart';
import 'package:bareq/Modules/Profile/edit_profile_screen.dart';
import 'package:bareq/Modules/Profile/logout_screen.dart';
import 'package:bareq/Modules/Profile/privacy_policy_screen.dart';
import 'package:bareq/Modules/Profile/profile_controller.dart';
import 'package:bareq/Modules/Profile/profile_widget/profile_definition_widget.dart';
import 'package:bareq/Modules/Profile/profile_widget/profile_list_item_widget.dart';
import 'package:bareq/Modules/Profile/subscription_profile_screen.dart';
import 'package:bareq/Utilities/Layout/loading_screen.dart';
import 'package:bareq/Widgets/back_button_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import '../../Utilities/Layout/helper.dart';


class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = "/ProfileScreen";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends StateMVC<ProfileScreen> {

 late ProfileController con;

 _ProfileScreenState() : super(ProfileController()) {
   con = ProfileController();
 }

  @override
  Widget build(BuildContext context) {
    print("user id = ${con.user.id}");
    return LoadingScreen(
      loading: con.loading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeClass.whiteColor,
          shadowColor: ThemeClass.greyLightColor,
          leading:  BackButtonWidget(),
          elevation: 10,
          title:  TextDefaultWidget(title: "my_profile".tr, fontSize: 16.sp, color: ThemeClass.blackColor,fontWeight: FontWeight.w400,),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            SizedBox(height: 28.h,),
            ProfileDefinitionWidget(profileTitle: con.user != null ? con.user!.name : "....."),
            Expanded(
              child: ListView.builder(
                itemCount: con.settings.length,
                  itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    switch(index) {
                      case 0: {
                        Modular.to.pushNamed(EditProfileScreen.routeName, arguments: con.user);
                      }
                      break;
                      case 1: {
                        Navigator.pushNamed(context, EditLocationProfileScreen.routeName);
                      }
                      break;
                      case 2: {
                        Navigator.pushNamed(context, SubscriptionProfileScreen.routeName);
                      }
                      break;
                      case 3: {
                        Navigator.pushNamed(context, ChangePasswordProfileScreen.routeName);
                      }
                      break;
                      case 4: {
                        Navigator.pushNamed(context, FrequentlyAskedQuestionsProfileScreen.routeName);
                      }
                      break;

                      case 5: {
                        Navigator.pushNamed(context, AboutScreen.routeName);
                      }
                      break;

                      case 6: {
                        Navigator.pushNamed(context, ContactUsScreen.routeName);
                      }
                      break;
                      case 7: {
                        Navigator.pushNamed(context, PrivacyPolicyScreen.routeName);
                      }
                      break;

                      case 8: {
                        Navigator.pushNamed(context, LogoutScreen.routeName);
                      }
                      break;
                      default: {
                        Navigator.pushNamed(context, EditProfileScreen.routeName);
                      }
                      break;
                    }
                  },
                child: ProfileListItemWidget(settingItem: con.settings[index]));
              }),
            )
          ],
        ),),
    );
  }
}
