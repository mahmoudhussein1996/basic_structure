import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Utilities/Layout/loading_screen.dart';
import 'package:bareq/Widgets/custom_button_widget.dart';
import 'package:bareq/Widgets/custom_dropdown_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../Theme/theme.dart';
import '../../../../Widgets/custom_textfeild_widget.dart';
import '../authentication_controller.dart';

class SignUpWidget extends StatefulWidget {

  AuthenticationController controller;
   SignUpWidget({Key? key, required this.controller}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {

  final GlobalKey<FormState> _formKey = GlobalKey();


  @override
  void initState() {
    widget.controller.timeZones = Helper.getTimeZones();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      loading: widget.controller.loading,
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  SizedBox(height: 32.h,),
                  CustomTextFieldWidget(
                    label: "full_name".tr,
                    hint: "full_name_hint".tr,
                    controller: widget.controller.registerNameController,
                    hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                    insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                    borderRadiusValue: 16.r,
                    validator: (val){
                      if(val!.trim().isEmpty) {
                        return "full_name_validation".tr;
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20.h,),
                  CustomTextFieldWidget(
                    label: "email".tr,
                    hint: "email_hint".tr,
                    controller: widget.controller.registerEmailController,
                    hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                    insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                    borderRadiusValue: 16.r,
                    validator: (val){
                      if(val!.trim().isEmpty) {
                        return "email_validation".tr;
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20.h,),
                  CustomTextFieldWidget(
                    label: "password".tr,
                    hint: "password_hint".tr,
                    controller: widget.controller.registerPasswordController,
                    hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                    borderRadiusValue: 16.r,
                    obscure:true,
                    suffixIcon: Icon(Icons.visibility, color: ThemeClass.normalgreyColor,),
                    validator: (val){
                      if(val!.trim().isEmpty)
                        {
                          return "password_validation".tr;
                        }
                      else if(val!.trim().length < 8)
                        {
                          return "must_more_than".tr;
                        }
                      else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 3.h,),
                  // TextDefaultWidget(title: "password_hint_desc".tr, fontSize: 12.sp,
                  //   fontWeight: FontWeight.w400, color: ThemeClass.normalgreyColor.withOpacity(.58),),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFieldWidget(
                          label: "phone_number".tr,
                          hint: "phone_number_hint".tr,
                          controller: widget.controller.registerPhoneController,
                          textInputType: TextInputType.number,
                          hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
                          insidePadding: EdgeInsets.symmetric(vertical: 10.h),
                          borderRadiusValue: 16.r,
                          validator: (val){
                            if(val!.trim().isEmpty) {
                              return "phone_number_validation".tr ;
                            }
                            else {
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
                              widget.controller.registerBirthDateController.text =
                                  DateFormat('yyyy-MM-dd').format(date);
                            });
                          },
                          child: CustomTextFieldWidget(
                            label: "date_of_birth".tr,
                            hint: "date_of_birth_hint".tr,
                            controller: widget.controller.registerBirthDateController,
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
                  SizedBox(height: 20.h,),
                  CustomDropDownWidget(onChange: (value){
                    print("country time zone = $value");
                    setState(() {
                      widget.controller.registerCountryController = value;
                    });
                  },selectedValue: widget.controller.timeZones.first,label: "select_country".tr,items: widget.controller.timeZones.map((e) => DropdownMenuItem(value: e,
                  child: TextDefaultWidget(title: e.toString(), color: ThemeClass.blackColor, fontSize: 10.sp, fontWeight: FontWeight.w500,),)).toList()),
            //       CountryListPick(
            //       appBar: AppBar(
            //         backgroundColor: ThemeClass.blackColor,
            //       title: Text('Select a country'),),
            //       initialSelection: 'EG',
            //       pickerBuilder: (context,code){
            //         return CustomTextFieldWidget(
            //           label: "select_country".tr,
            //           hint: "select_country_hint".tr,
            //           controller: widget.controller.registerCountryController,
            //           enable: false,
            //           hintStyle: TextStyle(fontSize: 14.sp, color: ThemeClass.greyColor, fontWeight: FontWeight.w500),
            //           borderRadiusValue: 16.r,
            //           suffixIcon: Icon(Icons.keyboard_arrow_down, color: ThemeClass.normalgreyColor,),
            //           validator: (val){
            //             val!.trim().isEmpty ?  "select_country_validation".tr :  "";
            //           },
            //         );
            //       },
            //       onChanged: (code) {
            //         widget.controller.registerCountryController.text = code!.name!;
            //        },
            //        useSafeArea: true,
            // ),
                  SizedBox(height: 20.h,),
                  // Row(children: [
                  //   Checkbox(value: true, onChanged: (val){}),
                  //   SizedBox(width: 8.w,),
                  //   TextDefaultWidget(title: "remember_me".tr, color: ThemeClass.mediumgreyColor,
                  //   fontWeight: FontWeight.w500, fontSize: 10.sp,)
                  // ],),
                  Row(children: [
                    Checkbox(value: widget.controller.acceptTerms, onChanged: (val){
                      setState(() {
                        widget.controller.acceptTerms = val!;
                      });
                    }),
                    SizedBox(width: 8.w,),
                    TextDefaultWidget(title: "accept_terms_privacy".tr, color: ThemeClass.mediumgreyColor,
                      fontWeight: FontWeight.w500, fontSize: 10.sp,)
                  ],),
                  SizedBox(height: 16.h,),
                  CustomButton(title: "sign_up".tr,radius: 6.r ,backgroundColor: widget.controller.acceptTerms ? ThemeClass.primaryColor : ThemeClass.greyLightColor,
                  textColor: widget.controller.acceptTerms ? ThemeClass.whiteColor:ThemeClass.blackColor,onTap: () async
                  {
                    // check if fall form data is valid ?
                    if(_formKey.currentState!.validate() && widget.controller.acceptTerms)
                      {
                        setState(() {
                          widget.controller.loading = true;
                        });
                        await widget.controller.register(context);
                        setState(() {
                          widget.controller.loading = false;
                        });
                      }
                  })
                ]
            ),
          ),
        ),
      ),
    );
  }
}
