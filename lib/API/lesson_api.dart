import 'package:bareq/Models/user_model.dart';
import 'package:bareq/Shared/shared_obj.dart';
import 'package:bareq/Shared/shared_preferances.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Utilities/toast_helper.dart';
import 'package:bareq/models/lesson_model.dart';
import 'package:flutter/material.dart';

import 'api.dart';

class LessonApi
{
  static Future<List<Lesson>> getFreeLessons()
  async
  {
    var response = await API.getRequest(
        url: API.freeLessons,
        headers: {
          "Accept":"application/json"
        },
       );

    if(response["data"] != null)
    {
      var result = response["data"];
      List<Lesson> lessons = List<Lesson>.from(result!.map((x) => Lesson.fromJson(x)));;
      return lessons;
    }
    else
    {
      ToastHelper.showError(message: "error in getting lessons");
      return [];
    }
  }

  static Future<List<Lesson>> getLessonsByUnitId(int unitId)
  async
  {
    var response = await API.getRequest(
      url: API.lessonByUnitId(unitId),
      headers: {
        "Accept":"application/json"
      },
    );
    if(response["data"] != null)
    {
      var result = response["data"];
      List<Lesson> lessons = List<Lesson>.from(result!.map((x) => Lesson.fromJson(x)));;
      return lessons;
    }
    else
    {
      ToastHelper.showError(message: "error in getting lessons");
      return [];
    }
  }
}