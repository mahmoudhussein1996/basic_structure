import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import '../../Shared/shared_preferances.dart';
import '../../Theme/theme.dart';
import '../../locale/locales.dart';

extension HexColor on Color {
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}


extension ContextExtensions on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}

extension OnTapImageExtension on Image {
  Widget showOnTap(){
    return InkWell(
      // onTap: (){
      //   Modular.to.push(MaterialPageRoute(builder: (_)=> ShowImagesWidget(
      //     images: const [],
      //     image: image,
      //   )));
      // },
      child: this,
    );
  }
}
extension OnTapFadeImageExtension on FadeInImage {
  Widget showOnTap(){
    return InkWell(
      // onTap: (){
      //   Modular.to.push(MaterialPageRoute(builder: (_)=> ShowImagesWidget(
      //     images: const [],
      //     image: image,
      //   )));
      // },
      child: this,
    );
  }
}
// ignore: camel_case_extensions
extension translate on String {
  String get tr => AppLocalizations.instance.translate(this)??"";
}



class Helper{

  static final timeAmOrPm = DateTime.now().hour < 12 ? 'am'.tr : "pm".tr;
  static final   String greeting = DateTime.now().hour < 12
      ? 'good_morning'.tr
      : DateTime.now().hour < 17
      ? "good_afternoon".tr
      : "good_evening".tr;

  static final hoursMinutesFormatter = DateFormat('HH:mm');
  static const String apiKey = 'AIzaSyDE9edvEd4aB5Lku2Uf86k2Tq2Nr-HyqTo';
  static bool sendLocationFlag = false;
  static const String imagePlaceHolder =
      "https://cdn-icons-png.flaticon.com/512/147/147140.png";
  static const String defaultNetworkImage =
      "https://leverageedublog.s3.ap-south-1.amazonaws.com/blog/wp-content/uploads/2019/11/23172210/List-of-Courses-after-10th-Standard.jpg";
  static final formatter = DateFormat('MMM dd, yyyy',SharedPref.getCurrentLang() ?? "ar");
  static final formatterCustom = DateFormat('yyyy MMM dd',SharedPref.getCurrentLang() ?? "ar");
  static final formatterCustom2 = DateFormat('dd MMM yyyy',SharedPref.getCurrentLang() ?? "ar");
  static final formatterCustom3 = DateFormat('dd / MM / yyyy',SharedPref.getCurrentLang() ?? "ar");
  static final formatterCustom4 = DateFormat('d - M - yyyy',SharedPref.getCurrentLang() ?? "ar");
  static final formatterCustomForApi = DateFormat('dd/MM/yyyy',SharedPref.getCurrentLang() ?? "ar");
  static final formatterCustomTime = DateFormat('m : h a',SharedPref.getCurrentLang() ?? "ar");
  static final formatterCustomDay = DateFormat('EEEE',SharedPref.getCurrentLang() ?? "ar");
  static String  getTimeZone(DateTime dateTime) =>DateFormat.jm().format(dateTime);

  // static const String imagePlaceHolder = "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png";
  // static shareItem({required String link, required String description}) async {
  //   final urlPreview = link;
  //   await Share.share(
  //       '$description$urlPreview');
  // }
  static String shortName(String name){
    List<String> names=name.trim().split(" ");
    return names.map((e) => e[0]).join();

  }
  static int daysBetween({required DateTime to}) {
    return to.difference(DateTime.now()).inDays;
  }

  // static String getTimeAgo(DateTime? time, {bool short = false}) {
  //   if (time == null) return "";
  //   String currentLng = SharedPref.getCurrentLang() ?? "ar";
  //   bool isAr = currentLng == "ar";
  //   timeago.setLocaleMessages(
  //     "$currentLng${short ? "_short" : ""}",
  //     (short && isAr)? timeago.ArShortMessages():
  //     (short && !isAr)? timeago.EnShortMessages():
  //     (isAr)? timeago.ArMessages(): timeago.EnMessages(),
  //   );
  //   return timeago.format(time, locale: "$currentLng${short ? "_short" : ""}");
  // }



  static Future<bool?> _getImageSource(BuildContext context)async {
    bool? isGallery;
    await showCupertinoModalPopup(
        context: context,
        barrierDismissible: true,
        useRootNavigator: true, builder: (context) {
      return CupertinoAlertDialog(
        title: Padding(
          padding: EdgeInsets.all(10.w),
          child: Text('choose_image_source'.tr,style: TextStyle(color: ThemeClass.blackColor,fontSize: 20.sp)),
        ),
        actions: [
          Material(
              color: ThemeClass.greyColor.withOpacity(.1),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  isGallery = true;
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
                    child: Text('from_gallery'.tr,style: TextStyle(color: ThemeClass.blackColor,fontSize: 20.sp),)),
              )
          ),
          Material(
              color: ThemeClass.greyColor.withOpacity(.1),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  isGallery = false;
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
                    child: Text('from_camera'.tr,style: TextStyle(color: ThemeClass.blackColor,fontSize: 20.sp),)),
              )
          ),
        ],
      );
    }
    );
    return isGallery;
  }

  static Future<File?> pickImage({required BuildContext context})async {
    bool? isGallery = await Helper._getImageSource(context);
    if(isGallery==null) return null;
    final XFile? file = await ImagePicker().pickImage(source: isGallery?ImageSource.gallery:ImageSource.camera);
    if(file!=null) return File(file.path);
    return null;
  }

  static Future<File?> pickVideo({required BuildContext context})async {
    bool? isGallery = await Helper._getImageSource(context);
    if(isGallery==null) return null;
    final XFile? file = await ImagePicker().pickVideo(source: isGallery?ImageSource.gallery:ImageSource.camera);
    if(file!=null) return File(file.path);
    return null;
  }

  static Future<List<File>> pickImages({required BuildContext context})async {
    final List<XFile> files = await ImagePicker().pickMultiImage(imageQuality: 75);
    return files.map((e) => File(e.path)).toList();
  }

  // static Future<File?> pickFile( {required BuildContext context}) async {
  //    final  pickedFile = await FilePicker.platform.pickFiles(allowMultiple: false);
  //   if (pickedFile == null) return null;
  //   if (pickedFile.files.first.path != null) {
  //     return File(pickedFile.files.first.path!);
  //   }
  //   return null;
  // }

  static Future<File?> getFileFromUrl(String? url) async {
    if(url==null) return null;
    try {
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      return await file.writeAsBytes(bytes, flush: true);
    } catch (e) {
      return null;
    }
  }
  //
  // static showBottomSheet({
  //   required BuildContext context,
  //   required Widget widget,
  //   Function? onDismiss,
  // }) async{
  //   await showModalBottomSheet(
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(
  //             top: Radius.circular(25.w))),
  //     backgroundColor: ThemeClass.whiteColor,
  //     context: context,
  //     isScrollControlled: true,
  //     builder: (BuildContext context)=> widget,).then((_) {
  //     if (onDismiss != null) onDismiss();
  //   });
  // }
/* BOTTOMSHEET BY EHAB*/
  static showBottomSheetCustomWidget(
      {bool showDivider = true,required BuildContext context, required Widget child, required callBack, bool? isDismissible=true,bool? needsHeight=false}) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: isDismissible??true,

        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            // maxChildSize: 1,
            initialChildSize:needsHeight ==true? 0.9.h:0.6.h,
            builder: (context, controller) {
              return StatefulBuilder(
                  builder: (ctx, setState) => Container(
                    // height: 456.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(50.r),
                            topEnd: Radius.circular(50.r)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.17),
                            offset: Offset(
                              0.0,
                              3.w,
                            ),
                            blurRadius: 6.r,
                            spreadRadius: 6.r,
                          ), //BoxShadow
                        ]),
                    child: Column(
                      children: [
                        SizedBox(height: 12.h),
                        showDivider ? Container(
                          width: 70.w,
                          height: 3.h,
                          decoration: BoxDecoration(
                              color: ThemeClass.blackColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(2.w)),
                        ) : SizedBox(),
                        SizedBox(height: 24.h),
                        child,
                      ],
                    ),
                  ));
            },
          );
        });
  }
/* BOTTOMSHEET BY EHAB*/

  static String getFileSize(File? file){
    if(file == null) return "0";
    return (file.lengthSync()/1024).toStringAsFixed(2);
  }
  static String getFileName(File? file){
    if(file == null) return "0";
    return file.path.split("/").last ;
  }

  static Future getOnlineFileSize(String? url)async{
    if(url == null) return null;
    http.Response r = await http.head(Uri.parse(url));
    return r.headers["content-length"];
  }
  static Future <DateTime> pickDate({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate:DateTime(1900),
      lastDate:  DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ThemeClass.primaryColor,
              onPrimary: ThemeClass.whiteColor,
              onSurface: ThemeClass.blackColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      return picked;
    }
    return DateTime.now();
  }
  static Future <TimeOfDay> pickTime(context) async {
   final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ThemeClass.primaryColor,
              onPrimary: ThemeClass.whiteColor,
              onSurface: ThemeClass.blackColor,
            ),
          ),
          child: child!,
        );
      },
    );
   if (pickedTime != null) {
     return pickedTime;
   }
   return TimeOfDay.now();
  }

  static bool isLinkImage(String? link) {
    if (link == null) return false;
    List extensions = [".jpg", ".gif", ".png", ".jpeg"];
    for (var value in extensions) {
      if (link.toLowerCase().contains(value.toLowerCase())) return true;
    }
    return false;
  }

  static bool isLinkSound(String? link) {
    if (link == null) return false;
    List extensions = [".mp4", ".m4a", ".WebM", ".wav", ".MP3", ".AAC"];
    for (String value in extensions) {
      if (link.toLowerCase().contains(value.toLowerCase())) return true;
    }
    return false;
  }

  static List<String> getTimeZones() {
    tz.initializeTimeZones();
    final locations = tz.timeZoneDatabase.locations;
    final formatter = DateFormat('HH:mm');
    final List<String> timeZones = [];

    for (var location in locations.values) {
      final timeZone = tz.getLocation(location.name);
      final offset = timeZone.currentTimeZone.offset;
      final offsetString = offset.isNegative ? '-' : '+';
      final formattedOffset = formatter.format(DateTime.fromMillisecondsSinceEpoch(offset).subtract(const Duration(hours: 2)));
      // final formattedOffset = formatter.format(offset.abs());
      final timeZoneString = '(GMT $offsetString$formattedOffset) ${location.name}';

      timeZones.add(timeZoneString);
    }

    return timeZones;
  }
}