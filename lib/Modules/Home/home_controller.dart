import 'package:bareq/API/level_api.dart';
import 'package:bareq/API/unit_api.dart';
import 'package:bareq/API/user_api.dart';
import 'package:bareq/Models/level_model.dart';
import 'package:bareq/Modules/Profile/profile_screen.dart';
import 'package:bareq/Modules/UserAuth/Authentication/authentication_screen.dart';
import 'package:bareq/Theme/theme.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:bareq/models/user_study.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Models/unit_model.dart';
import '../../Models/user_model.dart';
import '../../Shared/shared_preferances.dart';
import '../../Utilities/toast_helper.dart';
import '../Progress/progress_screen.dart';
import 'home_screen.dart';


class HomeController extends ControllerMVC {
  factory HomeController() {
    _this ??= HomeController._();
    return _this!;
  }

  static HomeController? _this;

  HomeController._();

  int selectedNavBarIndex = 0;
  bool loading = false, loadUserStudy = false;
  UserStudy? userStudy;
  final List screens = [
    //ProfileScreen(),
     const HomeScreen(),
    const ProgressScreen(),
    Center(child: TextDefaultWidget(title: "favorites", color: ThemeClass.mediumgreyColor,),),
    ProfileScreen()
  ];
  List<Level> levels = [];
    List<Unit> units = [];

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


  Future getUserStudy()
  async {
    setState(() {
      loadUserStudy = true;
    });

    //var response = await LessonApi.getFreeLessons();
   userStudy = await UserApi.getUserStudy(token: user.token, userId: user.id);

   print("lesson ename = ${userStudy!.currentLevel!.lesson!.enname}");

    setState(() {
      loadUserStudy = false;
    });

  }
  }

