import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Theme/theme.dart';

class CustomDialog {
  final String? title;
  final Widget? des;
  final Function()? onContinuePressed;

  const CustomDialog({
    Key? key,
    this.title,
    this.des,
    this.onContinuePressed,
  });

  showDeleteDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      backgroundColor: Colors.white,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          title == null
              ? const SizedBox()
              : Text(
                  title!,
                  style: TextStyle(
                    color: ThemeClass.primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
          const Spacer(),
          InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.close_sharp))
        ],
      ),
      content: des,
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FadeIn(delay: 1, from: SlideFrom.BOTTOM, child: alert);
      },
    );
  }
}
