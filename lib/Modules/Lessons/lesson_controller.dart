import 'package:bareq/API/lesson_api.dart';
import 'package:bareq/models/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';



class LessonController extends ControllerMVC {
  factory LessonController() {
    _this ??= LessonController._();
    return _this!;
  }

  static LessonController? _this;

  LessonController._();

  bool loading = false;

  List<Lesson> lessons = [];

  Future getAllLessonByUnitId(BuildContext context, int unitId)
  async {
    lessons = [];
    setState(() {
      loading = true;
    });

    lessons = await LessonApi.getLessonsByUnitId(unitId);
    if(lessons.isNotEmpty)
    {
      setState(() {
        loading = false;
      });
    }

    else
    {
      setState(() {
        loading = false;
      });

      //ToastHelper.showError(message: "units not loaded");
    }


  }
}
