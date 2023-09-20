import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import '../Shared/shared_preferances.dart';

class   API {
//  static const String baseServerURL = "https://api.kalemon.net/public";

  static const String _baseURL = "https://api.kalemon.net/public/api/";
 // static String socketIoUrl = "http://192.168.2.41:3000/chat?room=";

  //=========================== api parameters ====================================
  static const String login = "login";
  static const String logout = "logout";
  static const String register = "register";
  static const String forgetPassword = "reset/user/password/mail";
  static const String resetPassword = "user/password/update";
  static const String freeLessons = "free-lessons/fetch";
  static const String updateUserProfile = "user/profile/update";
  static const String updateUserLocation = "update/timezone";
  static const String contactUs = "contact-us";

 static  String levelByUserId(int? userId) =>"levels/fetch/$userId";
 static  String unitByLevelId(int? levelId) =>"get/unit/$levelId";
 static  String lessonByUnitId(int? unitId) =>"get/lessons/$unitId";
 static  String userStudy(int? unitId) => "user-study/get/$unitId";
 static  String elementByLessonId(int? lessonId,int? userId) =>"get/lesson/elements/$lessonId/$userId";




  static Future postRequest({
    required String url,
    required Map<String, String> body,
    List<http.MultipartFile> files = const [],
    Map<String, String>? headers,
  }) async {
    debugPrint(body.toString());
    debugPrint("$_baseURL$url");
    var request = MultipartRequest(
      'POST',
      Uri.parse('$_baseURL$url'),
      onProgress: (int bytes, int total) async {
        final progress = bytes / total;
        log(">>>>>>>>> progress: $progress");
      },
    );
    request.fields.addAll(body);
    for (int i = 0; i < files.length; i++) {
      request.files.add(files[i]);
    }

    request.headers.addAll({
      'Accept': 'application/json',
      'lang': SharedPref.getCurrentLang() ?? "en",
    });
    // if (SharedPref.getUserObg() != null) {
    //   request.headers.addAll(
    //       {'Authorization': 'Bearer ${SharedPref.getUserObg()?.accessToken??''}'});
    // }
    if (headers != null) request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String result = await response.stream.bytesToString();
    log(response.statusCode.toString());
    // if (response.statusCode == 401) {
    //   Modular.to.pushReplacementNamed(LoginScreen.routeName);
    //   return;
    // }
    log(result.toString());
    try {
      return json.decode(result);
    } catch (e) {
      return null;
    }
  }

  static Future getRequest({
    required String url,
    Map<String, String>? headers,
  }) async {
    debugPrint('$_baseURL$url');

    var request = http.Request('GET', Uri.parse('$_baseURL$url'));
    request.headers.addAll({
      'Accept': 'application/json',
      'lang': SharedPref.getCurrentLang() ?? "en",
     // 'Authorization': 'Bearer ${SharedPref.getUserObg()?.accessToken??''}'
    });
     if (headers != null) request.headers.addAll(headers);
    // debugPrint(request.headers.toString());

    http.StreamedResponse response = await request.send();

    String result = await response.stream.bytesToString();
    log(response.statusCode.toString());
    if (response.statusCode == 401) {
      //Modular.to.pushReplacementNamed(LoginScreen.routeName);
      return;
    }
    log(result.toString());
    return json.decode(result);
  }

  static Future<Uint8List?> getDataFromUrl({required String? url, Map<String, String>? headers,}) async {
    try{
      if(url == null) return null;
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({
        'Accept': 'application/json',
        'lang': SharedPref.getCurrentLang() ?? "en",
       // 'Authorization': 'Bearer ${SharedPref.getUserObg()?.accessToken??''}'
      });
      if (headers != null) request.headers.addAll(headers);
      debugPrint(request.headers.toString());

      http.StreamedResponse response = await request.send();
      return await response.stream.toBytes();
    }catch(e){
      log(">>>>>>>>>>>>>>>::$e");
      return null;
    }
  }

}

class MultipartRequest extends http.MultipartRequest {
  MultipartRequest(
    String method,
    Uri url, {
    required this.onProgress,
  }) : super(method, url);
  final void Function(int bytes, int totalBytes) onProgress;

  @override
  http.ByteStream finalize() {
    final byteStream = super.finalize();

    final total = contentLength;
    int bytes = 0;

    final t = StreamTransformer.fromHandlers(
      handleData: (List<int> data, EventSink<List<int>> sink) {
        bytes += data.length;
        onProgress(bytes, total);
        if (total >= bytes) {
          sink.add(data);
        }
      },
    );
    final stream = byteStream.transform(t);
    return http.ByteStream(stream);
  }
}
