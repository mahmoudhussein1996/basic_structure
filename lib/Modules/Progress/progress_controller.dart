import 'package:bareq/API/level_api.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Models/level_model.dart';
import '../../Models/user_model.dart';
import '../../Shared/shared_preferances.dart';



class ProgressController extends ControllerMVC {
  factory ProgressController() {
    _this ??= ProgressController._();
    return _this!;
  }

  static ProgressController? _this;
  ProgressController._();

  bool loading = false;
  List<Level> levels = [];

  User user = SharedPref.getUserObg();

  Future getAllLevels(BuildContext context)
  async {
    setState(() {
      loading = true;
    });

    //var response = await LessonApi.getFreeLessons();
    levels = await LevelApi.getLevelForUser(user.id);

    setState(() {
      loading = false;
    });

  }
}
