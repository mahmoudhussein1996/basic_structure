import 'package:bareq/API/level_api.dart';
import 'package:bareq/API/unit_api.dart';
import 'package:bareq/Models/level_model.dart';
import 'package:bareq/Modules/Profile/profile_screen.dart';
import 'package:bareq/Modules/UserAuth/Authentication/authentication_screen.dart';
import 'package:bareq/Theme/theme.dart';
import 'package:bareq/Utilities/Layout/helper.dart';
import 'package:bareq/Widgets/default_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Models/unit_model.dart';
import '../../Models/user_model.dart';
import '../../Shared/shared_preferances.dart';
import '../../Utilities/toast_helper.dart';


class UnitController extends ControllerMVC {
  factory UnitController() {
    _this ??= UnitController._();
    return _this!;
  }

  static UnitController? _this;

  late WebViewController unitTestWebViewController;

  UnitController._();

  bool loading = false;

  List<Unit> units = [];

  Future getAlllUnitsInLevel(BuildContext context, int levelId)
  async {
    units = [];
    setState(() {
      loading = true;
    });

    units = await UnitApi.getUnitsInLevel(levelId);

    setState(() {
      loading = false;
    });


  }
}
