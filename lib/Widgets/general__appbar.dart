import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../Theme/theme.dart';
import 'back_button_widget.dart';
import 'custom_sliver_appbar_tiltle_widget.dart';
import 'default_text_widget.dart';

class GeneralAppbar extends StatelessWidget {
  const GeneralAppbar({Key? key, required this.title,}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      expandedHeight: 80.h,
      collapsedHeight: 70.h,
      backgroundColor: Colors. grey[50],
      pinned: true,
      snap: false,
      floating: true,
      elevation: 5,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.symmetric(vertical: 12.h),
        title: CustomSliverAppBarTitleWidget(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                BackButtonWidget(),
                const Spacer(),
                TextDefaultWidget(
                  title: title,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: ThemeClass.blackColor,
                ),
                const Spacer(),
                // SharedPref.isUserLogIn() == true
                //     ? BackButtonWidget(
                //         icon: "assets/images/course/more-circle.svg",height: 30.w,width: 30.w,
                //   iconColor: ThemeClass.blackColor, onTap: onTapSeeMore,)
                //     : BackButtonWidget(
                //         icon: "assets/images/share.svg",
                //   iconColor: ThemeClass.blackColor,onTap: (){
                //    Helper.shareItem(link: 'https://play.google.com/store/apps/details?id=com.hopecorp.quran_azkar_ad3ya', description: 'تحميل تطبيق القرآن والأذكار بدون إنترنت.\الدّالّ علي الخير كفاعله\nصدقة جارية لمن ليس له من يتصدق عنه.\n\n',);
                //
                // },),
              ],
            ),
          ),
        ),
        background: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Row(
                  children: [
                    BackButtonWidget(),
                    const Spacer(),
                    TextDefaultWidget(
                      title: title,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: ThemeClass.blackColor,
                    ),
                    const Spacer(),
                    // SharedPref.isUserLogIn() == true
                    //     ? BackButtonWidget(
                    //         icon: "assets/images/course/more-circle.svg",height: 26.w,width: 26.w,
                    //   iconColor: ThemeClass.blackColor,
                    //   onTap: onTapSeeMore,
                    // )
                    //     :BackButtonWidget(
                    //   icon: "assets/images/share.svg",
                    //   iconColor: ThemeClass.blackColor,onTap: (){
                    //   Helper.shareItem(link: 'https://play.google.com/store/apps/details?id=com.hopecorp.quran_azkar_ad3ya', description: 'تحميل تطبيق القرآن والأذكار بدون إنترنت.\الدّالّ علي الخير كفاعله\nصدقة جارية لمن ليس له من يتصدق عنه.\n\n',);
                    //
                    // },),
                  ],
                ),
              ),
              // SizedBox(height: 8.h),
    

            ],
          ),
        ),
      ),
      leading: const SizedBox(),
    );
  }
}
