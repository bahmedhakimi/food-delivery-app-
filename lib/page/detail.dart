// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:delivery_app/page/homepage.dart';
import 'package:delivery_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Detail extends StatefulWidget {
  final menu;
  final appController;
  const Detail({required this.menu, required this.appController});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int numberOfOrder = 1;
  double price = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 0.5.h),
          decoration: BoxDecoration(color: Colors.amber.shade800),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_sharp, size: 3.h),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.favorite_sharp,
                    color: Colors.red,
                    size: 3.h,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 80.h,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45))),
                  margin: EdgeInsets.only(top: 32.h),
                  padding: EdgeInsets.only(top: 15.h, right: 1.w, left: 1.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.menu.title,
                        style: Themes.headinstyle(
                            context: context,
                            defaultValue: 20,
                            mobilesize: 20,
                            tabletsize: 23,
                            desktopsize: 26),
                      ),
                      SizedBox(
                        height: SizerUtil.orientation == Orientation.portrait
                            ? 2.h
                            : 0.2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/alarm-clock.png',
                                scale: 3.h,
                              ),
                              SizedBox(width: 1.w),
                              Text(
                                '${widget.menu.time} min',
                                style: Themes.subtitestyle(
                                    context: context,
                                    defaultValue: 18,
                                    mobilesize: 18,
                                    tabletsize: 23,
                                    desktopsize: 28),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/flame.png',
                                scale: 3.h,
                              ),
                              SizedBox(width: 1.w),
                              Text(
                                '${widget.menu.calories} calories',
                                style: Themes.subtitestyle(
                                    context: context,
                                    defaultValue: 18,
                                    mobilesize: 18,
                                    tabletsize: 23,
                                    desktopsize: 28),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/star.png',
                                scale: 3.h,
                              ),
                              SizedBox(width: 1.w),
                              Text(
                                widget.menu.rate.toString(),
                                style: Themes.subtitestyle(
                                    context: context,
                                    defaultValue: 18,
                                    mobilesize: 18,
                                    tabletsize: 23,
                                    desktopsize: 28),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizerUtil.orientation == Orientation.portrait
                            ? 2.h
                            : 0.2.h,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.menu.detail,
                              style: Themes.bodystyle(
                                  context: context,
                                  defaultValue: 18,
                                  mobilesize: 18,
                                  tabletsize: 23,
                                  desktopsize: 25),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 8.h,
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        numberOfOrder--;
                                        if (numberOfOrder < 1) {
                                          setState(() {
                                            numberOfOrder = 1;
                                          });
                                        }
                                      });
                                    },
                                    icon: const Icon(Icons.remove)),
                                Text(
                                  '$numberOfOrder',
                                  style: Themes.bodystyle(
                                      context: context,
                                      defaultValue: 18,
                                      mobilesize: 18,
                                      tabletsize: 23,
                                      desktopsize: 25),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        numberOfOrder++;
                                      });
                                    },
                                    icon: const Icon(Icons.add)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 8.h,
                              decoration: BoxDecoration(
                                  color: Colors.amber.shade300,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    child: Text(
                                      'Add to Cart',
                                      style: Themes.subtitestyle(
                                          context: context,
                                          defaultValue: 18,
                                          mobilesize: 18,
                                          tabletsize: 23,
                                          desktopsize: 28),
                                    ),
                                    onTap: () {
                                      if (numberOfOrder >= 1) {
                                        widget.appController.addorder(
                                            widget.menu.id,
                                            numberOfOrder,
                                            widget.menu.imageUrl,
                                            widget.menu.title,
                                            widget.menu.price);
                                        setState(() {
                                          widget.appController.totalprie
                                              .value = widget.appController
                                                  .totalprie.value +
                                              numberOfOrder * widget.menu.price;
                                        });
                                        Get.to(() => const MyHomePage());
                                      }
                                    },
                                  ),
                                  Text(
                                    '\$' + widget.menu.price.toString(),
                                    style: Themes.subtitestyle(
                                        context: context,
                                        defaultValue: 15,
                                        mobilesize: 15,
                                        tabletsize: 20,
                                        desktopsize: 25),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 5.h,
                left: 5.w,
                right: 5.w,
                child: SizedBox(
                  width: 45.w,
                  height: 40.h,
                  child: Image.asset(
                    widget.menu.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
