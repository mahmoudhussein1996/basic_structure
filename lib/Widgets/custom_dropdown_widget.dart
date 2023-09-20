import 'package:bareq/Theme/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomDropDownWidget<T> extends StatelessWidget {
  const CustomDropDownWidget({
    Key? key,
    this.prefixIcon,
    this.selectedValue,
    required this.onChange,
    this.validate,
    required this.items,
    this.borderColor,
    this.width,
    this.hint,
    this.label,
     this.validationText,
  }) : super(key: key);
  final Widget? prefixIcon;
  final Color? borderColor;
  final List<DropdownMenuItem<T>> items;
  final T? selectedValue;
  final void Function(dynamic)? onChange;
  final String? hint;
  final String? label;
  final String? Function(dynamic)? validate;
  final double? width;
  final String? validationText;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: selectedValue,
      //iconOnClick: const Icon(Icons.keyboard_arrow_up),
      decoration: InputDecoration(
        //suffixIcon: Icon(Icons.keyboard_arrow_down_outlined, color: ThemeClass.greyDarkColor,),
        // suffix: Icon(Icons.keyboard_arrow_down_outlined, color: ThemeClass.greyDarkColor,),
        // isCollapsed: true,
        //  prefix: Icon(Icons.keyboard_arrow_down_outlined, color: ThemeClass.greyDarkColor,),
        //  prefixIcon: Icon(Icons.keyboard_arrow_down_outlined, color: ThemeClass.greyDarkColor,),
        //icon: Icon(Icons.keyboard_arrow_down_outlined, color: ThemeClass.greyDarkColor,),
        labelText: label,
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: ThemeClass.blackColor)),
      ),
      hint: Text(
        hint ?? '',
        style: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xFFA5A5A5),
            fontWeight: FontWeight.w400),
      ),
      items: items,
      validator: (value) {
        if (value == null) {
          return validationText;
        }
      },
      onChanged: onChange,
    );
  }
}
