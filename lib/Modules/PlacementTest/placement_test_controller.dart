import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';




class PlacementTestController extends ControllerMVC {
  factory PlacementTestController() {
    _this ??= PlacementTestController._();
    return _this!;
  }

  static PlacementTestController? _this;
  PlacementTestController._();

  bool loading = false;



// Future getFreeLesson(BuildContext context)
// async {
//   setState(() {
//     loading = true;
//   });
//
//   //var response = await LessonApi.getFreeLessons();
//   lessons = await LessonApi.getFreeLessons();
//   if(lessons.isNotEmpty)
//   {
//     ToastHelper.showSuccess(message: "lessons loaded successfully");
//     // Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName, (_)=> false);
//
//     setState(() {
//       loading = false;
//     });
//   }
//
//   else
//   {
//     ToastHelper.showError(message: "lessons not loaded");
//   }
//
//
// }
}
