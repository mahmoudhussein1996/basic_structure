import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Theme/theme.dart';
import '../../../Widgets/default_text_widget.dart';
import 'authentication_widgets/confirm_button_widget.dart';
class RegisterSuccessScreen extends StatefulWidget {
  static const String routeName = "/RegisterSuccessScreen";
  const RegisterSuccessScreen({Key? key}) : super(key: key);

  @override
  State<RegisterSuccessScreen> createState() => _RegisterSuccessScreenState();
}

class _RegisterSuccessScreenState extends State<RegisterSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: ThemeClass.primaryColor,
        body: Container(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // ThemeClass is class of used color in app
                    ThemeClass.blueLightColor,
                    ThemeClass.blueLightColor2,
                  ])),
          child: Column(
            children: [
              /*
             screen util values :
             h = height, w = width, r= radius, sp = px
             */

              SizedBox(height: 158.h,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(color: ThemeClass.blueLightColor0, width: 1.w),),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 72.h,),
                    // custom text widget
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w),
                      child: TextDefaultWidget(title: "congratulations".tr,
                        fontSize: 32.sp, fontWeight: FontWeight.w600,),
                    ),
                    SizedBox(height: 8.h,),
                    TextDefaultWidget(title: "register_success".tr,
                      textAlign: TextAlign.center,
                      fontSize: 16.sp, fontWeight: FontWeight.w500,),
                    SizedBox(height: 94.h,),
                    Row(
                      children: [
                        Expanded(child: CofirmButtonWidget(title: "yes_i_have".tr, color: ThemeClass.blackDarktColor,onTap: (){
                          // Navigator.pushNamed(context, )
                        })),
                        SizedBox(width: 8.w,),
                        Expanded(child: CofirmButtonWidget(title: "no_i_haven't".tr, color: ThemeClass.blueLightColor0,onTap: (){

                        })),

                      ],
                    ),
                    SizedBox(height: 52.h,),
                  ],
                ),
              ),
              const Spacer(),
              const DividerWidget(),
              SizedBox(height: 8.h,),
            ],
          ),
        ),
      floatingActionButton: Container(
        width: 48.w, height: 48.h,
        decoration: BoxDecoration(
          color:ThemeClass.whiteColor,
          borderRadius: BorderRadius.circular(6.r)),
        child: Center(child: Icon(Icons.arrow_forward_ios, size: 16, color: ThemeClass.blueLightColor0,)),
      ),
    );
  }
}
