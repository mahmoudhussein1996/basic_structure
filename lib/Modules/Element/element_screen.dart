import 'package:bareq/Modules/Home/home_controller.dart';
import 'package:bareq/Modules/Units/unit_controller.dart';
import 'package:bareq/Modules/Units/units_widgets/unit_item_widget.dart';
import 'package:bareq/Modules/element/element_controller.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Utilities/Layout/loading_screen.dart';
import 'package:bareq/Widgets/custom_button_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import 'element_widgets/element_item_widget.dart';

class ElementScreen extends StatefulWidget {
  static String routeName = "/ElementScreen";

   String name;
   int id;

  ElementScreen({Key? key, required this.id, required this.name}) : super(key: key);

  @override
  _ElementScreenState createState() => _ElementScreenState();
}

class _ElementScreenState extends StateMVC<ElementScreen> {

  _ElementScreenState() : super(ElementController()) {
    con = ElementController();
  }

 late ElementController con;

  @override
  void initState() {
    // final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // id = args['id'];
    // name = args['name'];
    con.getElementsInLesson(context, widget.id);
     super.initState();
  }
  //

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     // backgroundColor: ThemeClass.blueLightColor5,
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
                children: [
                  SizedBox(height: 24.h,),
                  Row(children: [
                    BackButton(color: ThemeClass.blackColor,),
                    TextDefaultWidget(title: widget.name, color: ThemeClass.blackColor, fontSize: 16.sp, fontWeight: FontWeight.w600,),

                  ],),
                  SizedBox(height: 12.h,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                    decoration: BoxDecoration(color:ThemeClass.blueLightColor5,borderRadius: BorderRadius.circular(12.r)),
                    child: Row(
                      children: [
                       SvgPicture.asset("assets/images/encourage.svg",),
                       SizedBox(width: 15.w,),
                       Expanded(
                         child: Column(
                           children: [
                             TextDefaultWidget(title: "element_encourage".tr,fontSize: 15.sp, color: ThemeClass.brown,fontWeight: FontWeight.w500,),
                             SizedBox(height: 20.h,),
                              ClipRRect(
                               borderRadius: BorderRadius.circular(15.r),
                               child: LinearProgressIndicator(backgroundColor: ThemeClass.whiteColor, valueColor: AlwaysStoppedAnimation(ThemeClass.orangeColor,), value: .4, minHeight:4.h))
                           ],
                         ),
                       )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  con.elements.isEmpty? Align(
                    alignment: Alignment.center,
                    child: TextDefaultWidget(title: "no_unit".tr, textAlign: TextAlign.center,color: ThemeClass.mediumgreyColor,
                      fontSize: 14.sp, fontWeight: FontWeight.w600,),
                  ):Expanded(
                    child: ListView.builder(
                        itemCount: con.elements.length,
                        itemBuilder: (context, index)
                    {
                      return ElementItem(element: con.elements[index],indexOfElement: index);
                    }),
                  ),
                  SizedBox(height: 10.h,),
                  CustomButton(title: "next lesson",backgroundColor: ThemeClass.primaryColor,
                  radius: 6.r, verticalPadding: 18.h,
                  onTap: (){})
                ]
            ),
          ),
        ),
      ),
    );
  }
}
