import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class PackagesController extends ControllerMVC
{
  factory PackagesController()
  {
    _this ?? PackagesController._();
    return _this!;
  }

  static PackagesController? _this;
  PackagesController._();

  bool loading = false;
  bool planSelected = false;

}