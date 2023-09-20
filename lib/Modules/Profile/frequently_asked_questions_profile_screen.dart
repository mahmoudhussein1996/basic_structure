import 'package:bareq/Modules/Profile/profile_controller.dart';
import 'package:bareq/Modules/Profile/profile_widget/frequently_asked_questions_item_widget.dart';
import 'package:bareq/Modules/Profile/profile_widget/profile_definition_widget.dart';
import 'package:bareq/Widgets/back_button_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Theme/theme.dart';
import '../../Utilities/Layout/helper.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/custom_textfeild_widget.dart';


class FrequentlyAskedQuestionsProfileScreen extends StatefulWidget {
  FrequentlyAskedQuestionsProfileScreen({Key? key}) : super(key: key);

  static const String routeName = "/FrequentlyAskedQuestionsProfileScreen";

  @override
  State<FrequentlyAskedQuestionsProfileScreen> createState() => _FrequentlyAskedQuestionsProfileScreenState();
}

class _FrequentlyAskedQuestionsProfileScreenState extends State<FrequentlyAskedQuestionsProfileScreen> {

  ProfileController profileController = ProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeClass.whiteColor,
        shadowColor: ThemeClass.greyLightColor,
        leading:  BackButtonWidget(),
        elevation: 10,
        title:  TextDefaultWidget(title: "my_profile".tr, fontSize: 16.sp, color: ThemeClass.blackColor,fontWeight: FontWeight.w400,),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            SizedBox(height: 32.h,),
            Row(children: [SvgPicture.asset("assets/images/unlock.svg"), SizedBox(width: 18.w,), TextDefaultWidget(title: "faq".tr, color: ThemeClass.orangeColor,
              fontSize: 20.sp, fontWeight: FontWeight.w500,),],),
            SizedBox(height: 44.h,),
            Expanded(
              child: ListView.builder(
              itemCount: profileController.frequencyAskedQuestionsList.length,
              itemBuilder: (context,index)
              {
                return FrequentlyAskedQuestionsItemWidget(frequentlyAskedQuestions: profileController.frequencyAskedQuestionsList[index],);
              }),
            ),
            SizedBox(height: 44.h,),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: TextDefaultWidget(title: "need_more_info".tr, color: ThemeClass.orangeColor,
                fontSize: 12.sp, fontWeight: FontWeight.w500,),
            ),
            SizedBox(height: 54.h,),
          ],
        ),
      ),);
  }
}
