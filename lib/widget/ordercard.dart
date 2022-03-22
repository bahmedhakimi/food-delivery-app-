// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:delivery_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderCard extends StatefulWidget {
  final ordermenu;
  final color;
  final index;
  final appController;
  const OrderCard(
      {required this.ordermenu,
      required this.color,
      required this.index,
      required this.appController});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2.w, left: 2.w, top: 1.h, bottom: 1.h),
      height: 20.h,
      decoration: BoxDecoration(
          color: widget.color.shade100,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 35.w,
            height: 35.h,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Center(
              child: Image.asset(widget.ordermenu['image']),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      widget.ordermenu['title'],
                      style: Themes.headinstyle(
                          context: context,
                          defaultValue: 18,
                          mobilesize: 20,
                          tabletsize: 25,
                          desktopsize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  width: 28.w,
                  height: 10.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            right: 2.w,
                            left: 3.w),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25))),
                        child: Text(
                          '\$' + widget.ordermenu['price'].toString(),
                          style: Themes.bodystyle(
                              context: context,
                              defaultValue: 15,
                              mobilesize: 25,
                              tabletsize: 32,
                              desktopsize: 35),
                        ),
                      ),
                      //position of numberoforder
                      Positioned(
                        top: 0,
                        right: widget.ordermenu['price'] >= 100
                            ? 1.w
                            : widget.ordermenu['price'] < 10
                                ? 4.w
                                : 2.5.w,
                        child: Container(
                          width: 5.w,
                          height: 5.h,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Center(
                            child: Text(
                              widget.ordermenu['numberoforder'].toString(),
                              textAlign: TextAlign.center,
                              style: Themes.bodystyle(
                                  context: context,
                                  defaultValue: 15,
                                  mobilesize: 15,
                                  tabletsize: 20,
                                  desktopsize: 25),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(bottom: 1.h,right: 1.w),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {
                  widget.appController.removeorder(widget.index);
                  setState(() {
                    widget.appController.totalprie.value =
                        widget.appController.totalprie.value -
                            widget.ordermenu['numberoforder'] *
                                widget.ordermenu['price'];
                  });
                },
                icon: Icon(
                  Icons.delete_forever_sharp,
                  size: 8.w,
                  color: Colors.red,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
