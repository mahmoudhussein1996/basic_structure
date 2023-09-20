import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Theme/theme.dart';
import '../../../../Widgets/custom_button_gradient_widget.dart';
import '../../../../Widgets/default_text_widget.dart';
class ConfirmPasswordResetBottomSheet extends StatelessWidget {
  const ConfirmPasswordResetBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r)),
            ),
            alignment: Alignment.center,
            child: Material(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 65.h),
                  SvgPicture.asset(
                    "assets/images/user_auth/successfully_pass_changed_smile.svg",
                    // width: 100.w,
                    // height: 100.h,
                  ),
                  SizedBox(height: 24.h),
                  TextDefaultWidget(
                      title: "successfully_password_changed".tr,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: ThemeClass.blackColor),
                  SizedBox(height: 8.h),
                  TextDefaultWidget(
                      title: "login_to_start".tr,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: ThemeClass.greyColor),
                  SizedBox(height: 40.h),
                  Container(
                    // width: 280.w,
                    padding: EdgeInsets.symmetric(horizontal: 54.w),
                    child: Material(
                      child: CustomGradientButtonWidget(
                        title: 'login'.tr,
                        // onPressed: () => Modular.to.pushNamedAndRemoveUntil(
                        //     LoginScreen.routeName,
                        //         (Route<dynamic> route) => false),
                      ),
                    ),
                  ),
                  SizedBox(height: 90.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
// class BottomScrollSheetWidget extends StatelessWidget{
//
//
//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       minChildSize: 0.2,
//       maxChildSize: 0.8,
//       initialChildSize: orderReceived == 0 ? 0.2 : 0.8,
//       builder: (context, controller) {
//         return StatefulBuilder(
//             builder: (ctx, setState) => Container(
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadiusDirectional.only(
//                           topStart: Radius.circular(50.r),
//                           topEnd: Radius.circular(50.r)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.17),
//                           offset: Offset(
//                             0.0,
//                             3.w,
//                           ),
//                           blurRadius: 6,
//                           spreadRadius: 6.0,
//                         ), //BoxShadow
//                       ]),
//                   child: Container(
//                     color: Colors.transparent,
//                     alignment: AlignmentDirectional.center,
//                     child: Text('fsdnvdsnkldsfdfs'),
//                   ),
//                 ));
//       },
//     );
//   }
// }
