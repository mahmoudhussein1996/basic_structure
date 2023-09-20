import 'dart:io';

import 'package:bareq/API/element_api.dart';
import 'package:bareq/Models/elemnt_model.dart';
import 'package:bareq/Modules/element/element_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:vdocipher_flutter/vdocipher_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Models/user_model.dart';
import '../../Shared/shared_preferances.dart';


class ElementController extends ControllerMVC {
  factory ElementController() {
    _this ??= ElementController._();
    return _this!;
  }

  static ElementController? _this;

  ElementController._();

  bool loading = false;
  bool loadingVideos = false;
  int  elementIndex = 0;
  List<ElementModel> elements = [];

  User user = SharedPref.getUserObg();

  WebViewController? webViewController;
  WebViewController? levelTestWebViewController;
  late Map<String, dynamic> videoData;

  VdoPlayerController? vdoPlayerController;
  final double aspectRatio = 16/9;
  VdoError? vdoError;
  bool loadingVideo = true;
  ValueNotifier<bool> isFullScreen = ValueNotifier(false);
  String? nativePlatformLibraryVersion = 'Unknown';

  @override
  void initState() {
    videoData = <String, dynamic>{};
    super.initState();
  }
  Future getElementsInLesson(BuildContext context, int lessonId)
  async {
    elements = [];
    setState(() {
      loading = true;
    });

    elements = (await ElementApi.getElementForLesson(lessonId,user.id));

    setState(() {
      loading = false;
    });

    }

  Future getVideoData(String videoId)
  async {

    setState(() {
      loadingVideos = true;
    });

    videoData = await ElementApi.getVideoData(videoId);

    setState(() {
      loadingVideos = false;
    });
  }

  moveNextItem(BuildContext context)
  {
    setState(() {
      if(elementIndex < elements.length-1)
      {
        elementIndex +=1;
      }
      if(elements[elementIndex].file.fileType == "2")
      {
        webViewController!.loadUrl(elements[elementIndex].file.path);
      }
      else if(elements[elementIndex].file.fileType == "1")
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)
        => ElementDetailsScreen(element: elements[elementIndex])));
      }

    });
  }

  movePreviousItem(BuildContext context)
  {
    setState(() {
      if(elementIndex > 0)
      {
        elementIndex -=1;
      }
      if(elements[elementIndex].file.fileType == "2")
      {
        webViewController!.loadUrl(elements[elementIndex].file.path);
      }
      else if(elements[elementIndex].file.fileType == "1")
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)
        => ElementDetailsScreen(element: elements[elementIndex])));
      }
    });
  }

  onVdoError(error)  {
    print("Oops, the system encountered a problem: $error");
  }

  onPlayerCreated(VdoPlayerController? controller) {
    setState(() {
      vdoPlayerController = controller;
      onEventChange(vdoPlayerController);
    });
  }

  onEventChange(VdoPlayerController? controller) {
    controller!.addListener(() {
      VdoPlayerValue value = controller.value;

      print("VdoControllerListner"
          "\nloading: ${value.isLoading} "
          "\nplaying: ${value.isPlaying} "
          "\nbuffering: ${value.isBuffering} "
          "\nended: ${value.isEnded}"
      );
    });
  }

  // onFullscreenChange(isFullscreen) {
  //   setState(() {
  //     isFullScreen.value = isFullscreen;
  //   });
  // }

  nonFullScreenContent() {
    return Column(
        children: [
          Text('Sample Playback', style: TextStyle(fontSize: 20.0),)
        ]);
  }

  double getHeightForWidth(double width) {
    return width / aspectRatio;
  }
}
