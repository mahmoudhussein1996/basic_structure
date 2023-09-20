import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../API/lesson_api.dart';
import '../../Utilities/toast_helper.dart';
import '../../models/lesson_model.dart';


class FreeLessonController extends ControllerMVC {
  factory FreeLessonController() {
    _this ??= FreeLessonController._();
    return _this!;
  }

  static FreeLessonController? _this;
  FreeLessonController._();

  bool loading = false;
  List<Lesson> lessons = [];


  Future getFreeLesson(BuildContext context)
  async {
    setState(() {
      loading = true;
    });

    //var response = await LessonApi.getFreeLessons();
    lessons = await LessonApi.getFreeLessons();
    if(lessons.isNotEmpty)
    {
      ToastHelper.showSuccess(message: "lessons loaded successfully");
     // Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName, (_)=> false);

      setState(() {
        loading = false;
      });
    }

    else
      {
        ToastHelper.showError(message: "lessons not loaded");
      }


  }
}
