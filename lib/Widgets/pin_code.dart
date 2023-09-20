import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../Theme/theme.dart';

class PinCodeWidget extends StatelessWidget {
  final TextEditingController controller;
  final int length;
  final double? size;

  const PinCodeWidget(
      {Key? key, required this.controller, this.length = 4, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 375.w,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: PinCodeTextField(
          appContext: context,
          length: length,
          animationType: AnimationType.fade,
          cursorColor: ThemeClass.primaryColor,
          validator: (String? v) {
            if (v == null || v.isEmpty || v.length < 4) return "";
            return null;
          },
          pinTheme: PinTheme(
            borderWidth: 1,
            errorBorderColor: Colors.red,
            shape: PinCodeFieldShape.box,
            fieldHeight: 60.w,
            fieldWidth: 65.w,
            activeFillColor: Colors.transparent,
            activeColor: ThemeClass.primaryColor,
            inactiveColor: ThemeClass.blackColor,
            selectedColor: ThemeClass.primaryColor,
            inactiveFillColor: Colors.transparent,
            selectedFillColor: Colors.transparent,
            borderRadius: BorderRadius.circular(8.w),
          ),
          hintCharacter: " ",
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          autoDisposeControllers: false,
          controller: controller,
          onChanged: (value) {},
          keyboardType: TextInputType.number,
          beforeTextPaste: (text) {
            return true;
          },
        ),
      ),
    );
  }
}
