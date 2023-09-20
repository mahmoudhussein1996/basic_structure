import 'package:bareq/Modules/lessons/lesson_screen.dart';
import 'package:bareq/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Models/unit_model.dart';
import '../../../Utilities/Layout/helper.dart';
import '../../../Widgets/default_text_widget.dart';

class UnitItem extends StatelessWidget {
  Unit unit;
  UnitItem({Key? key, required this.unit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)
        => LessonScreen(name: unit.enname!, id: unit.id!)));
      },
      child: Stack(
         children: [
           Container(
             width: 160.w, height: 144.h,
             decoration: BoxDecoration(
                 image: DecorationImage(image: NetworkImage(unit.image!))),
           ),
           Positioned(
             top: 104.h,
             child: Container(
                 width:160.w, height: 44.h,
                 decoration: BoxDecoration(color:ThemeClass.whiteColor.withOpacity(.9),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.r),
                     bottomRight: Radius.circular(16.r))),
                 child: Center(child: TextDefaultWidget(title: unit.enname!,fontSize: 14.sp, color: ThemeClass.primaryColor,fontWeight: FontWeight.w600,))),
           ),
         ],
      ),
    );
  }
}
