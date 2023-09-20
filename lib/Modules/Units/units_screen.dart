import 'package:bareq/Modules/Home/home_controller.dart';
import 'package:bareq/Modules/Home/level_test_screen.dart';
import 'package:bareq/Modules/Units/unit_controller.dart';
import 'package:bareq/Modules/Units/units_widgets/unit_item_widget.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Utilities/Layout/loading_screen.dart';
import 'package:bareq/Widgets/custom_button_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';

class UnitsScreen extends StatefulWidget {
  static String routeName = "/UnitsScreen";
   String levelName;
   String levelTest;
   int levelId;

   UnitsScreen({Key? key, required this.levelId, required this.levelName, required this.levelTest}) : super(key: key);

  @override
  _UnitsScreenState createState() => _UnitsScreenState();
}

class _UnitsScreenState extends StateMVC<UnitsScreen> {

  _UnitsScreenState() : super(UnitController()) {
    con = UnitController();
  }

 late UnitController con;

  @override
  void initState() {
    // final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // id = args['id'];
    // name = args['name'];
    con.getAlllUnitsInLevel(context, widget.levelId);
     super.initState();
  }
  //

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ThemeClass.blueLightColor5,
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
                children: [
                  SizedBox(height: 24.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    BackButton(color: ThemeClass.whiteColor,),
                    Expanded(child: TextDefaultWidget(title: widget.levelName, color: ThemeClass.whiteColor, fontSize: 16.sp, fontWeight: FontWeight.w600,)),
                    SizedBox(width: 30.w,),
                    CustomButton(width:156.w,height: 48.h,title: "level_test".tr,borderColor: ThemeClass.whiteColor,textColor: ThemeClass.mediumgreyColor,fontSize: 11.sp,
                    horizontalPadding: 8.w,radius: 6.r,verticalPadding: 8.h,backgroundColor: ThemeClass.whiteColor,onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> LevelTestScreen(testUrl: widget.levelTest,)));
                     })
                  ],),
                  SizedBox(height: 22.h,),
                  con.units.isEmpty? Column(
                     children: [
                       SizedBox(height: 300.h,),
                       TextDefaultWidget(title: "no_unit".tr, textAlign: TextAlign.center,color: ThemeClass.mediumgreyColor,
                         fontSize: 14.sp, fontWeight: FontWeight.w600,),
                     ],
                  ):Expanded(
                    child: GridView.builder(
                        itemCount: con.units.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 9.w,
                            mainAxisSpacing: 16.h
                        ), itemBuilder: (context, index)
                    {
                      return UnitItem(unit: con.units[index]);
                    }),
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}
