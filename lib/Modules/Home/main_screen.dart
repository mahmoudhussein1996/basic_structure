import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Models/user_model.dart';
import '../../Theme/theme.dart';
import 'home_controller.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "/MainScreen";


   MainScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<MainScreen> {

  _HomeScreenState() : super(HomeController()) {
    con = HomeController();
  }

  late HomeController con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: con.screens[con.selectedNavBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ThemeClass.primaryColor,
        unselectedItemColor: ThemeClass.blackColor,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            con.selectedNavBarIndex = index;
          });
        },
        currentIndex: con.selectedNavBarIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/home.svg", color: con.selectedNavBarIndex == 0 ?
            ThemeClass.primaryColor : ThemeClass.blackColor,),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/chart.svg", color: con.selectedNavBarIndex == 1 ?
            ThemeClass.primaryColor : ThemeClass.blackColor,),
            label: "progress",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/star.svg",color: con.selectedNavBarIndex == 2 ?
            ThemeClass.primaryColor : ThemeClass.blackColor),
            label: "favorites",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/user.svg", color: con.selectedNavBarIndex == 3 ?
            ThemeClass.primaryColor : ThemeClass.blackColor),
            label: "my profile",
          ),

        ],),
    );
  }
}
