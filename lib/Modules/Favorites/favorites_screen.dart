import 'package:bareq/Modules/Favorites/favorites_controller.dart';
import 'package:bareq/Modules/FreeLessons/free_lesson_controller.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Theme/theme.dart';
import '../../Widgets/back_button_widget.dart';
import '../../Widgets/default_text_widget.dart';

class FavoritesScreen extends StatefulWidget {
  static const String routeName = "/FavoritesScreen";
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends StateMVC<FavoritesScreen> {

  _FavoritesScreenState() : super(FavoritesController()) {
    con = FavoritesController();
  }

  late FavoritesController con;

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: ThemeClass.whiteColor,
      //   shadowColor: ThemeClass.greyLightColor,
      //   leading: const BackButtonWidget(),
      //   elevation: 10,
      //   title:  TextDefaultWidget(title: "".tr, fontSize: 16.sp, color: ThemeClass.blackColor,fontWeight: FontWeight.w400,),
      // ),
      body: SizedBox(

      ),
    );
  }
}
