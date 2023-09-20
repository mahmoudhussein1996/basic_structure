import 'package:bareq/Modules/Home/home_controller.dart';
import 'package:bareq/Modules/Units/unit_controller.dart';
import 'package:bareq/Modules/Units/units_widgets/unit_item_widget.dart';
import 'package:bareq/Modules/element/element_controller.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Utilities/Layout/loading_screen.dart';
import 'package:bareq/Utilities/toast_helper.dart';
import 'package:bareq/Widgets/back_button_widget.dart';
import 'package:bareq/Widgets/custom_button_widget.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:vdocipher_flutter/vdocipher_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Models/elemnt_model.dart';
import '../../Theme/theme.dart';

class ElementDetailsScreen extends StatefulWidget {
  static String routeName = "/ElementDetailsScreen";

  ElementModel element;

  ElementDetailsScreen({Key? key, required this.element}) : super(key: key);

  @override
  _ElementDetailsScreenState createState() => _ElementDetailsScreenState();
}

class _ElementDetailsScreenState extends StateMVC<ElementDetailsScreen> {

  _ElementDetailsScreenState() : super(ElementController()) {
    con = ElementController();
  }

  late ElementController con;


  @override
  void initState() {
    print("init state start");
    if(widget.element.file.fileType == "1")
      {
        var splits = widget.element.file.path.split("videos/");
        String videoId = splits[1].trim();
         con.getVideoData(videoId);
      }

    super.initState();
  }
  //

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
                  SizedBox(height: 24.h,),
                  Row(children: [
                    BackButtonWidget(),
                    SizedBox(width: 20.w),
                    TextDefaultWidget(title: con.elements[con.elementIndex].enName, color: ThemeClass.blackColor, fontSize: 16.sp, fontWeight: FontWeight.w600,),

                  ],),
                  SizedBox(height: 12.h,),
                  con.elements[con.elementIndex].file.fileType == "2" ? Expanded(
                    child: WebView(
                      zoomEnabled: true ,
                      initialUrl: con.elements[con.elementIndex].file.path,
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (WebViewController webViewController){
                        con.webViewController = webViewController;
                      },
                    ),
                  ) : SizedBox(
                    height: 190.h,
                    child: con.loadingVideos ? const Center(child: CircularProgressIndicator()): VdoPlayer(
                    embedInfo:  EmbedInfo.streaming(
                    otp: con.videoData!["otp"],
                        playbackInfo: con.videoData!["playbackInfo"],
                        embedInfoOptions: const EmbedInfoOptions(
                            autoplay: true
                        )),
                    onPlayerCreated: (controller) => con.onPlayerCreated(controller),
                    controls: true,
                    onFullscreenChange: (isFullScreen){
                      isFullScreen = false;
                    },
                    onError: (VdoError vdoError) {
                      print("error in video ${vdoError.message}");
                      ToastHelper.showError(message: vdoError.message);
                    }, //optional, set false to disable player controls
                  )),
                  SizedBox(height: 12.w,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(title: "Previous Object",radius: 6.r,verticalPadding: 16.h,fontSize: 14.sp,horizontalPadding:26.w,backgroundColor: ThemeClass.primaryColor,onTap: (){
                       con.movePreviousItem(context);
                      }),
                      SizedBox(width: 14.w,),
                      CustomButton(title: "Next Object",radius: 6.r,verticalPadding: 16.h,fontSize: 14.sp,horizontalPadding:26.w,backgroundColor: ThemeClass.primaryColor,onTap: (){
                        con.moveNextItem(context);
                      }),
                    ],)
                ]
            ),
          ),
        ),
      ),
    );
  }

}
