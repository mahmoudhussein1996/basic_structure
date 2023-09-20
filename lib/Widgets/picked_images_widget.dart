import 'dart:io';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Theme/theme.dart';
import 'custom_stack_widget.dart';

class PickedImagesWidget extends StatefulWidget {
  const PickedImagesWidget({Key? key, required this.pickedImages,  required this.noImagesCallback}) : super(key: key);
  final List<File>pickedImages;
  final void Function(bool isEmpty) noImagesCallback;

  @override
  State<PickedImagesWidget> createState() => _PickedImagesWidgetState();
}

class _PickedImagesWidgetState extends State<PickedImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 74.h,
      width: double.maxFinite,
      child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsetsDirectional.only(top: 8.h),
          scrollDirection: Axis.horizontal,
          children:widget.pickedImages.map((e) => GestureDetector(
            onTap: () {
              setState(() {
                widget.pickedImages.remove(e);
                if(widget.pickedImages.isEmpty){
                  widget.noImagesCallback(true);
                }
              });
            },
            child: ConfirmSendingImageWidget(
              pickedImage: e,
            ),
          )).toList()),
    );
  }
}


class ConfirmSendingImageWidget extends StatelessWidget {
  const ConfirmSendingImageWidget({Key? key, required this.pickedImage, this.onTapRemove})
      : super(key: key);

  final File pickedImage;
  final void Function()? onTapRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 12.w),
      child: CustomStackWidget(
        children: [
          Container(
            height: 70.h,
            width: 70.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r), // Image border
                border: Border.all(color: ThemeClass.blackColor.withOpacity(0.7), width: 1.5.w)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(34.r), // Image radius
                child: Image.file(pickedImage, fit: BoxFit.cover).showOnTap(),
              ),
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


