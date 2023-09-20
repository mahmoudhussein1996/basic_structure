import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../Theme/theme.dart';
import '../Utilities/Layout/helper.dart';
import 'custom_stack_widget.dart';


class ConfirmSendingFileWidget extends StatelessWidget {
  const ConfirmSendingFileWidget({Key? key, required this.pickedFile, this.onTapRemove})
      : super(key: key);

  final File? pickedFile;
  final void Function()? onTapRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 12.w),
      child: CustomStackWidget(
        children: [
          Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.r),
              border: Border.all(color: ThemeClass.blackColor.withOpacity(0.7),),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 62.h,
                  width: 62.h,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: ThemeClass.greyColor.withOpacity(0.2),
                    borderRadius:
                    BorderRadius.circular(4.r),
                  ),
                  child: SvgPicture.asset(
                    "assets/images/file.svg",
                    height: 100.w,
                    width: 100.w,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(Helper.getFileName(pickedFile),
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: ThemeClass.blackColor),
                        maxLines: 1,
                      ),
                      // SizedBox(height: 4.h),
                      Text(
                        "${Helper.getFileSize(pickedFile)} Kb",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: ThemeClass.greyColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            end: -8.w,
            top: -8.h,
            child: Container(
              padding: EdgeInsets.all(1.5.w),
              decoration: BoxDecoration(
                  color: ThemeClass.whiteColor, shape: BoxShape.circle),
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                    color: ThemeClass.blackColor, shape: BoxShape.circle),
                child: GestureDetector(
                  onTap: onTapRemove,
                  child: Icon(
                    Icons.close,
                    color: ThemeClass.whiteColor,
                    size: 10.w,
                  ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class PickedFileWidget extends StatefulWidget {
   PickedFileWidget({Key? key, required this.pickedFile,  required this.noImagesCallback}) : super(key: key);
  File? pickedFile;
  final void Function(bool isEmpty) noImagesCallback;

  @override
  State<PickedFileWidget> createState() => _PickedFileWidgetState();
}

class _PickedFileWidgetState extends State<PickedFileWidget> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 70.h,
      width: double.maxFinite,
      child:  GestureDetector(
      onTap: () {
        setState(() {
          widget.pickedFile=null;
          widget.noImagesCallback(true);

        });
      },
      child: ConfirmSendingFileWidget(
        pickedFile: widget.pickedFile,
      ),
    ),
    );
  }
}

