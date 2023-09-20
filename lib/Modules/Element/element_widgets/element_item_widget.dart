import 'package:bareq/Models/elemnt_model.dart';
import 'package:bareq/Modules/element/element_controller.dart';
import 'package:bareq/Modules/lessons/lesson_screen.dart';
import 'package:bareq/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Models/unit_model.dart';
import '../../../Utilities/Layout/helper.dart';
import '../../../Widgets/default_text_widget.dart';
import '../element_details_screen.dart';

class ElementItem extends StatefulWidget {
  
  ElementModel element;
  int indexOfElement;
  ElementItem({Key? key, required this.element, required this.indexOfElement}) : super(key: key);

  @override
  _ElementItemState createState() => _ElementItemState();
}

class _ElementItemState extends StateMVC<ElementItem> {

  _ElementItemState() : super(ElementController()) {
    con = ElementController();
  }

  late ElementController con;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          con.elementIndex = widget.indexOfElement;
        });
        Navigator.of(context).push(MaterialPageRoute(builder: (context)
        => ElementDetailsScreen(element: widget.element,)));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 5.h),
            decoration: BoxDecoration(color:ThemeClass.blueLightColor5,borderRadius: BorderRadius.circular(16.r)),
            child: Row(
              children: [
                Container(
                    width:45.w, height: 45.h,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(22.r),
                        border: Border.all(color: ThemeClass.whiteColor),
                    image: DecorationImage(image: NetworkImage(widget.element.logo))),),
                SizedBox(width: 20.w,),
                TextDefaultWidget(title: widget.element.enName,fontSize: 15.sp, color: ThemeClass.brown,fontWeight: FontWeight.w500,)
              ],
            ),
          ),
          SizedBox(height: 8.h,)
        ],
      ),
    );
  }
}
