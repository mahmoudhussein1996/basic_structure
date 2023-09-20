
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../Utilities/toast_helper.dart';



class FavoritesController extends ControllerMVC {
  factory FavoritesController() {
    _this ??= FavoritesController._();
    return _this!;
  }

  static FavoritesController? _this;
  FavoritesController._();

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
