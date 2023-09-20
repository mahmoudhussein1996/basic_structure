import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SharedDataProvider with ChangeNotifier {

  // Future getUniversities() async {
  //
  //   universities = await RegistrationApi.getUniversities();
  //   // for (int i=0;i <universities.length ;i++ ) {
  //   //   colleges = List.from(universities[i].colleges ??[]);
  //   //   print('collee ya pop${colleges.length}');
  //   //
  //   //  //  universities[i].colleges?.map((college) {
  //   //  //   colleges.add(college);
  //   //  //   print('collee ya pop${colleges.length}');
  //   //  // });
  //   //
  //   // }
  //
  //
  // }
  //
  // Future getUniversities() async {
  //   HomeModel? model = await HomeApi.homeApi();
  //   setHomeModel(model);
  //
  //   if (homeModel?.attendStatus == '3' || homeModel?.attendStatus == '4') {
  //     startTimeout(
  //       currentSeconds: int.parse(homeModel?.totalRest ?? ''),
  //     );
  //   }
  //
  //   if (model?.breakStatus != '0' && model?.breakStatus != null) {
  //     startTimerDown(
  //       currentSeconds: int.parse(homeModel?.breakTime ?? ''),
  //     );
  //   }
  //   notifyListeners();
  // }
}
