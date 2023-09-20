import 'package:bareq/Modules/Profile/profile_controller.dart';
import 'package:bareq/Modules/Profile/profile_widget/adress_item_widget.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import '../../Widgets/back_button_widget.dart';
import '../../Widgets/custom_textfeild_widget.dart';
import '../../Widgets/default_text_widget.dart';
class ContactUsScreen extends StatefulWidget {
  static const String routeName = "/ContactUsScreen";

  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends StateMVC<ContactUsScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();

  _ContactUsScreenState() : super(ProfileController()) {
    con = ProfileController();
  }
  late ProfileController con;

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
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                SizedBox(height: 32.h,),
                Row(children: [SvgPicture.asset("assets/images/contact_us.svg"), SizedBox(width: 18.w,),
                  TextDefaultWidget(title: "contact_us".tr, color: ThemeClass.orangeColor,
                    fontSize: 20.sp, fontWeight: FontWeight.w500,),],),
                SizedBox(height: 8.h,),
                TextDefaultWidget(title: "we_love_hear".tr, color: ThemeClass.mediumgreyColor,
                  fontSize: 10.sp, fontWeight: FontWeight.w400,),
                SizedBox(height: 20.h,),
                CustomTextFieldWidget(
                  label: "subject".tr,
                  hint: "subject_hint".tr,
                  controller: con.subjectController,
                  hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                  insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                  borderRadiusValue: 16.r,
                  validator: (val){
                    if(val!.trim().isEmpty)
                    {
                      return "subject_validation".tr;
                    }
                    else
                    {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 12.h,),
                CustomTextFieldWidget(
                  label: "your_message".tr,
                  hint: "your_message_hint".tr,
                  maxLine: 6,
                  controller: con.contentController,
                  hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                  insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                  borderRadiusValue: 16.r,
                  validator: (val){
                    if(val!.trim().isEmpty)
                    {
                     return "your_message_validation".tr;
                    }
                    else
                      {
                        return null;
                      }
                  },
                ),
                SizedBox(height: 12.h,),
                TextDefaultWidget(title: "address".tr, color: ThemeClass.primaryColor,
                  fontSize: 12.sp, fontWeight: FontWeight.w600,),
                SizedBox(height: 12.h,),
                ListView.builder(
                    itemCount: 5,
                     shrinkWrap: true,
                    itemBuilder: (context,index)
                    {
                      return const AddressItemWidget();
                    }),
                SizedBox(height: 44.h,),
                CustomButton(title: "send_message".tr, radius: 10.r,backgroundColor: ThemeClass.primaryColor,
                 onTap: () async {
                   if(_formKey.currentState!.validate())
                   {
                     setState(() {
                       con.loading = true;
                     });

                     await con.contactUs(context);

                     setState(() {
                       con.loading = false;
                     });
                   }
                 }),
                SizedBox(height: 20.h,),
              ],
            ),
          ),
        ),
      ),);
  }
}
