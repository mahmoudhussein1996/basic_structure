import 'package:bareq/Models/frequently_asked_questions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Theme/theme.dart';
import '../../../Widgets/default_text_widget.dart';

class FrequentlyAskedQuestionsItemWidget extends StatefulWidget {

  FrequentlyAskedQuestions frequentlyAskedQuestions;
   FrequentlyAskedQuestionsItemWidget({Key? key, required this.frequentlyAskedQuestions}) : super(key: key);

  @override
  State<FrequentlyAskedQuestionsItemWidget> createState() => _FrequentlyAskedQuestionsItemWidgetState();
}

class _FrequentlyAskedQuestionsItemWidgetState extends State<FrequentlyAskedQuestionsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(title: TextDefaultWidget(title: widget.frequentlyAskedQuestions.question,
          fontSize: 14.sp, fontWeight: FontWeight.w500, color: ThemeClass.primaryColor,),
          trailing: Icon(Icons.arrow_forward_ios, size: 14.sp, color: ThemeClass.normalgreyColor,),
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: TextDefaultWidget(title: widget.frequentlyAskedQuestions.answer,maxLines: 40 ,textAlign: TextAlign.start,color: ThemeClass.greyDarkColor, fontSize: 14.sp, fontWeight: FontWeight.w500,),
          )
        ],),
        // Container(
        //   margin:EdgeInsets.symmetric(horizontal: 26.w),
        //   height: .5.h, color: ThemeClass.normalgreyColor,width: double.infinity,),
      ],
    );
  }
}
