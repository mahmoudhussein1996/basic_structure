import 'package:bareq/Modules/Profile/profile_controller.dart';
import 'package:bareq/Widgets/back_button_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import '../../Utilities/Layout/helper.dart';
import '../../Widgets/custom_button_widget.dart';
import '../../Widgets/custom_textfeild_widget.dart';


class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  static const String routeName = "/EditProfileScreen";

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends StateMVC<EditProfileScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();

  _EditProfileScreenState() : super(ProfileController()) {
    con = ProfileController();
  }
  late ProfileController con;

  @override
  void initState() {
    con.nameController.text = con.user.name;
    con.emailController.text = con.user.email;
    con.phoneController.text = con.user.phone;
    con.dateOfBirthController.text = con.user.dateOfBirth;

    print("user date of birth = ${con.user.dateOfBirth}");

    super.initState();
  }
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
                SizedBox(height: 24.h,),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(radius:60.r,backgroundImage:  const NetworkImage(Helper.defaultNetworkImage),),
                      Positioned(left: 80.w, top: 80.h,
                        child: Container(width:34.w, height:34.h,decoration:BoxDecoration(borderRadius: BorderRadius.circular(17.r), color: ThemeClass.whiteColor.withOpacity(.8),),
                            child: SvgPicture.asset(width: 7, height: 7, "assets/images/camera.svg", fit: BoxFit.scaleDown,)),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 32.h,),
                TextDefaultWidget(title: "your_information".tr, color: ThemeClass.orangeColor,
                fontSize: 20.sp, fontWeight: FontWeight.w500,),
                SizedBox(height: 30.h,),
                CustomTextFieldWidget(
                  label: "full_name".tr,
                  hint: "full_name_hint".tr,
                  controller: con.nameController,
                  hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                  insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                  borderRadiusValue: 16.r,
                  validator: (val){
                    val!.trim().isEmpty ?  "full_name_validation".tr :  "";
                  },
                ),
                SizedBox(height: 20.h,),
                CustomTextFieldWidget(
                  label: "email".tr,
                  hint: "email_hint".tr,
                  controller: con.emailController,
                  hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                  insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                  borderRadiusValue: 16.r,
                  validator: (val){
                    if(val!.trim().isEmpty)
                      {
                       return "email_validation".tr;
                      }
                    else
                      {
                        return null;
                      }
                  },
                ),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFieldWidget(
                        label: "phone_number".tr,
                        hint: "phone_number_hint".tr,
                        controller: con.phoneController,
                        textInputType: TextInputType.number,
                        hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                        insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                        borderRadiusValue: 16.r,
                        validator: (val){
                          if(val!.trim().isEmpty)
                          {
                            return "phone_number_validation".tr;
                          }
                          else
                          {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          DateTime date = await Helper.pickDate(context: context);
                          setState(() {
                            con.dateOfBirthController.text =
                                DateFormat('yyyy-MM-dd').format(date);
                          });
                        },
                        child: CustomTextFieldWidget(
                          label: "date_of_birth".tr,
                          hint: "date_of_birth_hint".tr,
                          controller: con.dateOfBirthController,
                          enable: false,
                          hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                          borderRadiusValue: 16.r,
                          suffixIcon: Icon(Icons.keyboard_arrow_down, color: ThemeClass.normalgreyColor,),
                          validator: (val){
                            if(val!.trim().isEmpty)
                            {
                              return "date_of_birth_validation".tr;
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 65.h,),
                CustomButton(title: "save_changes".tr, radius: 6.r,backgroundColor: ThemeClass.primaryColor,
                onTap: () async {
                  if(_formKey.currentState!.validate())
                  {
                    setState(() {
                      con.loading = true;
                    });

                    await con.updateUserData(context);

                    setState(() {
                      con.loading = false;
                    });
                  }
                }),
                SizedBox(height: 20.h,),
                CustomButton(title: "cancel".tr, radius: 6.r,textColor: ThemeClass.primaryColor,borderColor: ThemeClass.primaryColor,onTap: (){
                  Navigator.pop(context);
                })
              ],
            ),
          ),
        ),
      ),);
  }
}
