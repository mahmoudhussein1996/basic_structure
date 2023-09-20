// import 'package:bareq/Utilities/Layout/helper.dart';
// import 'package:bareq/Widgets/custom_button_widget.dart';
// import 'package:bareq/Widgets/divider_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../Theme/theme.dart';
// import '../../../Widgets/app_title_widget.dart';
// import '../../../Widgets/custom_dropdown_widget.dart';
// import '../../../Widgets/default_text_widget.dart';
//
// class RegisterTypeScreen extends StatefulWidget {
//   static const String routeName = "/RegisterTypeScreen";
//
//   const RegisterTypeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RegisterTypeScreen> createState() => _RegisterTypeScreenState();
// }
//
// class _RegisterTypeScreenState extends State<RegisterTypeScreen> {
//
//   bool student = false, parent = false;
//   String selectedAcademyYearValue = "test1";
//   List items = ["test1", "test2", "test3"];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Positioned(right: 0,
//                 child: Image.asset("assets/images/Vector.png")),
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal: 16.w),
//               child: Column(
//                 children: [
//                   SizedBox(height: 34.h,),
//                   AppTitleWidget(),
//                   SizedBox(height: 16.h,),
//                   TextDefaultWidget(
//                       title: 'authentication_note'.tr,
//                       color: ThemeClass.mediumgreyColor,
//                       fontSize: 16.sp, fontWeight: FontWeight.w400
//                   ),
//                   SizedBox(height: 32.h,),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: InkWell(
//                           onTap: (){
//                             if(parent == true || student == false) {
//                               setState(() {
//                                 parent = false;
//                                 student = true;
//                               });
//                             }
//                           },
//                           child: Container(
//                             height: 144.h,
//                             padding: EdgeInsets.all(12.w),
//                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r),
//                               border: Border.all(color: student ? Colors.transparent : ThemeClass.primaryColor),
//                             color: student ?  ThemeClass.primaryColor: ThemeClass.whiteColor,),
//                             child: Stack(children: [
//                               TextDefaultWidget(title: "continue_as_student".tr, fontSize: 20.sp, fontWeight: FontWeight.w500,
//                                 color: student ? ThemeClass.whiteColor : ThemeClass.primaryColor,),
//                               Positioned(right:4.w, bottom: 2.h ,child: Image.asset("assets/images/student.png", width: 38.w, height: 90.h,))
//                             ],),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 8.w,),
//                       Expanded(child: InkWell(
//                         onTap: (){
//                           if(student == true || parent == false) {
//                             setState(() {
//                               student = false;
//                               parent = true;
//                             });
//                           }
//                         },
//                         child: Container(
//                           padding: EdgeInsets.all(12),
//                           height: 144.h,
//                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r),
//                             border: Border.all(color: student ? Colors.transparent : ThemeClass.primaryColor),
//                             color: parent ?  ThemeClass.primaryColor: ThemeClass.whiteColor,),
//                           child: Stack(children: [
//                             TextDefaultWidget(title: "continue_as_parent".tr, fontSize: 20.sp, fontWeight: FontWeight.w500,
//                               color: parent ? ThemeClass.whiteColor : ThemeClass.primaryColor,),
//                             Positioned(
//                               bottom: 2.h, right: 4.w,
//                                 child: Image.asset("assets/images/parent.png", width: 68.w, height: 50.h,))
//                           ],),
//                         ),
//                       )),
//                     ],
//                   ),
//                   SizedBox(height: 22.h,),
//                   SizedBox(height: 32.h,),
//                   CustomButton(title: "sign_up".tr,radius: 6.r,backgroundColor: ThemeClass.primaryColor,onTap: (){
//                     // Navigator.pushNamed(context, AuthenticationScreen.routeName);
//                   }),
//                   SizedBox(height: 16.h,),
//                   CustomButton(title: "explore_free_lesson".tr,textColor: ThemeClass.primaryColor,radius: 6.r,borderColor: true,backgroundColor: ThemeClass.whiteColor,onTap: (){
//                     // Navigator.pushNamed(context, AuthenticationScreen.routeName);
//                   }),
//                   SizedBox(height: 100.h,),
//                   Row(
//                     children: [
//                       TextDefaultWidget(title: "login_ask".tr, fontSize: 15.sp, fontWeight: FontWeight.w500, color: ThemeClass.greyColor,),
//                       SizedBox(width: 10.w,),
//                       TextDefaultWidget(title: "login".tr, fontSize: 15.sp, fontWeight: FontWeight.w600, color: ThemeClass.primaryColor,)
//                     ],
//                   ),
//                   SizedBox(height: 48.h,),
//                   const DividerWidget(),
//                   SizedBox(height: 8.h,),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
