import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Theme/theme.dart';

class CarouselWidget extends StatefulWidget {
  final List<Widget> paymentWidgets;
  // final List<String>? caroselList;
  final bool isCarouseDot;
  final int dotsLength;
  int currentIndex;
  void Function(int x) currentIndexCallback;
  CarouselWidget({
    Key? key,
    // this.caroselList,
    this.isCarouseDot = true,
    this.paymentWidgets=const[],
    this.currentIndex = 0,
    required this.currentIndexCallback, required this.dotsLength,
  }) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: false,
            enableInfiniteScroll: false,
            viewportFraction: 1,
            enlargeCenterPage: false,
            // viewportFraction: (widget.caroselList != null) ? 1 : 0.85,
            aspectRatio: 2.9,
            initialPage: 0,
            height: 170.h,
            onPageChanged: (index, reason) {
              setState(() {
                widget.currentIndex = index;
                // print(widget.currentIndex);
                widget.currentIndexCallback(index);
              });
            },
          ),
          items: widget.paymentWidgets,
        ),
        // if (widget.isCarouseDot)SizedBox(height: 14.h),
        if (widget.isCarouseDot)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap:  () {
                  setState(() {
                    if (widget.currentIndex != 0) {
                      widget.currentIndex--;
                    }
                  });
                  _controller.previousPage();
                },
                child: CircleAvatar(
                  backgroundColor: widget.currentIndex != 0
                      ? ThemeClass.whiteColor
                      : Colors.grey.withOpacity(0.2),
                  child: Icon(Icons.arrow_back_sharp,
                      size: 26.w,
                      color: widget.currentIndex != 0
                          ? ThemeClass.blackColor
                          : Colors.grey.withOpacity(0.5)),
                ),
              ),
              Spacer(),
              ...List.generate(
              widget.dotsLength,
                (index) => buildDot(index, context),
              ),
              Spacer(),
              GestureDetector(
              onTap:  () {
                setState(() {
                  if (widget.currentIndex != widget.dotsLength-1) {
                    widget.currentIndex++;
                  }
                });
                _controller.nextPage();
              },
                child: CircleAvatar(
                  backgroundColor: widget.currentIndex != widget.dotsLength-1
                      ? ThemeClass.whiteColor
                      : Colors.grey.withOpacity(0.2),
                  child: Icon(Icons.arrow_forward_sharp,
                      size: 26.w,
                      color: widget.currentIndex != widget.dotsLength-1
                          ? ThemeClass.blackColor
                          : Colors.grey.withOpacity(0.5)),
                ),
              )
            ],
          )
      ],
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: widget.currentIndex == index ? 15.h : 10.h,
      width: widget.currentIndex == index ? 15.w : 10.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: widget.currentIndex == index
            ? ThemeClass.whiteColor
            : Colors.grey.withOpacity(0.2),
        border: Border.all(
          color: widget.currentIndex == index
              ? ThemeClass.whiteColor
              : Colors.grey.withOpacity(0.2),
        ),
      ),
    );
  }
}
