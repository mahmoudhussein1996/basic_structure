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

class LevelTestScreen extends StatefulWidget {
  String testUrl;
  LevelTestScreen({Key? key, required this.testUrl}) : super(key: key);

  @override
  _LevelTestScreenState createState() => _LevelTestScreenState();
}

class _LevelTestScreenState extends StateMVC<LevelTestScreen> {

  _LevelTestScreenState()
  {
    con = ElementController();
  }
  late ElementController con;

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
                  Center(child: TextDefaultWidget(title: "level_test".tr, color: ThemeClass.whiteColor, fontSize: 24.sp, fontWeight: FontWeight.w600,)),
                  SizedBox(height: 18.h,),
                  Expanded(
                    child: WebView(
                      zoomEnabled: true ,
                     // initialUrl: widget.testUrl,
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (WebViewController webViewController){
                        webViewController.loadUrl(widget.testUrl,
                           // headers: {"Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiNDkwMTExMWNhYmU4MzJmMzI0NGVlODNmYjMxZTMzMTU4MGZkZWIxZDEyZjJmNmQ3MTU5ZWRjNzNkOGExYzdmOTAwYmU5ZDY1MzEyZmI2OTMiLCJpYXQiOjE2ODY4Mjk0MjcsIm5iZiI6MTY4NjgyOTQyNywiZXhwIjoxNzE4NDUxODI3LCJzdWIiOiIxNTAxOSIsInNjb3BlcyI6W119.Dk3fjYWz65IDGmEK0rFTOyzWROW6L4KooVUsooj-3NKF1TLt411vEifGzLoXqXNCDngC1FtKFoKAudFDlVaGAlxRg4LpHrxFuqEZydOzlBpt1uJb9lQyEhVes6aJ676ryHONlgMVRwC_oCaT4JVy5FX7vjseDv5iLrDape4cHS_ohPsBtitrTkdIaGHb7m7_Ym07d5dO5QgXt5fRmOCYwpnq9IqFph2IYyAIW9l_GXUvPillNqhHjCNjqI0Mi50YlwM9wTcNBUvD_qDDIa9G16J1TwHmx1Jf-JnMto5056zOuB9Mibfo_X5rSOZVQscF06sm2EvvzDTsbFFTIUvjclmvTLfSvM_DIHMI1GYwe3rBCRMn6lmizf0ipmRgOu3hWbhD_wgu9uw2KHf1wfTGmzh7HmGExsk4EjxVvLOzhgpMZWPye7qMSphq1AT9bnb9UybUv1A5i4vRzBGDwsbQjRO_sqm21qNNT_OzT5kmQCN57QIPPTOCUN95B2qBWfqvZeLIgYjVobK7OT8g7r0zC6oIkY2P-j72vIOgoPU27uqReS7LDsPNJrsp293AeKBDMZM7d_pIafZDg5eAWvGdj9uDFM7i9Q2bEp19F6oZDmRPeqfcNRhs_d8qYlVLm1Ns_Q1Db45kHYeeoYXlpa5UfffWQJT8zaCR30Ur4kCxBS4"}
                        );
                        con.levelTestWebViewController = webViewController;
                      },
                    ),
                  ) ,
                  SizedBox(height: 12.w,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     CustomButton(title: "Previous Object",radius: 6.r,verticalPadding: 16.h,fontSize: 14.sp,horizontalPadding:26.w,backgroundColor: ThemeClass.primaryColor,onTap: (){
                  //       con.movePreviousItem(context);
                  //     }),
                  //     SizedBox(width: 14.w,),
                  //     CustomButton(title: "Next Object",radius: 6.r,verticalPadding: 16.h,fontSize: 14.sp,horizontalPadding:26.w,backgroundColor: ThemeClass.primaryColor,onTap: (){
                  //       con.moveNextItem(context);
                  //     }),
                  //   ],)
                ]
            ),
          ),
        ),
      ),
    );
  }
}
