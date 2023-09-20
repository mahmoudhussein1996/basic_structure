import 'package:bareq/Modules/Units/unit_controller.dart';
import 'package:bareq/Modules/element/element_controller.dart';
import 'package:bareq/Theme/theme.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Utilities/Layout/loading_screen.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UnitTestScreen extends StatefulWidget {
  String testUrl;
  UnitTestScreen({Key? key, required this.testUrl}) : super(key: key);

  @override
  _UnitTestScreenState createState() => _UnitTestScreenState();
}

class _UnitTestScreenState extends StateMVC<UnitTestScreen> {

  _UnitTestScreenState()
  {
    con = UnitController();
  }
  late UnitController con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.blueLightColor5,
      body: SafeArea(
        child: LoadingScreen(
          loading: con.loading,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
                children: [
                  SizedBox(height: 10.h,),
                  Center(child: TextDefaultWidget(title: "unit_test".tr, color: ThemeClass.whiteColor, fontSize: 24.sp, fontWeight: FontWeight.w600,)),
                  SizedBox(height: 18.h,),
                  Expanded(
                    child: WebView(
                      zoomEnabled: true ,
                      initialUrl: widget.testUrl,
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (WebViewController webViewController){
                        con.unitTestWebViewController = webViewController;
                      },
                    ),
                  ) ,
                  SizedBox(height: 12.w,),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
