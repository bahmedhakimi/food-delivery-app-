import 'package:delivery_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MenuCard extends StatefulWidget {
  final menu;
  final color;
  const MenuCard({required this.menu, required this.color});

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55.w,
      height: 40.h,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 50.w,
              height: SizerUtil.deviceType == DeviceType.mobile ? 30.h : 28.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [
                      widget.color.shade100,
                      widget.color.shade100,
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  )),
              margin: EdgeInsets.only(top: 10.h),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 35.w,
              height: 18.h,
              child: Image.asset(
                widget.menu.imageUrl,
                fit: BoxFit.contain,
              ),
              decoration: const BoxDecoration(shape: BoxShape.circle),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.menu.title,
                  style: Themes.subtitestyle(
                      context: context,
                      defaultValue: 15,
                      mobilesize: 15,
                      tabletsize: 17,
                      desktopsize: 20),
                ),
              ),
            ),
          ),
          Positioned(
            top: 23.h,
            left: 5.w,
            right: 2.w,
            child: Padding(
              padding: EdgeInsets.only(left: 1.w, right: 1.w),
              child: Text(
                widget.menu.detail.substring(
                        0,
                        widget.menu.detail.length < 50
                            ? widget.menu.detail.length
                            : (widget.menu.detail.length > 100)
                                ? 80
                                : 60) +
                    '........',
                style: Themes.bodystyle(
                    context: context,
                    defaultValue: 15,
                    mobilesize: 15,
                    tabletsize: 17,
                    desktopsize: 20),
              ),
            ),
          ),
          Positioned(
            top: 35.h,
            left: 5.w,
            child: Text(
              '\$' + widget.menu.price.toString(),
              style: Themes.subtitestyle(
                  context: context,
                  defaultValue: 15,
                  mobilesize: 15,
                  tabletsize: 20,
                  desktopsize: 25),
            ),
          ),
        ],
      ),
    );
  }
}

/*  */