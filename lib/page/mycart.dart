// ignore_for_file: unused_element, unused_field, avoid_print

import 'package:delivery_app/theme/theme.dart';
import 'package:delivery_app/widget/ordercard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MyCart extends StatefulWidget {
  final appController;
  final color_list;
  const MyCart({required this.appController, required this.color_list});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  Position? _currentPosition;
  String _currentAddress = '';
  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = p[0];
      print(_currentPosition!.latitude);
      print(_currentPosition!.longitude);

      setState(() {
        _currentAddress =
            "${place.locality},${place.administrativeArea.toString().split(' ')[0]},${place.country}";
        print(_currentAddress);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber.shade800,
          ),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 15.h,
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45))),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios_sharp, size: 4.h),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'My Card',
                          style: Themes.headinstyle(
                              context: context,
                              defaultValue: 18,
                              mobilesize: 18,
                              tabletsize: 21,
                              desktopsize: 25),
                        )),
                    Container(
                      height: 10.h,
                      margin: EdgeInsets.only(left: 2.w, right: 2.w, top: 2.h),
                      padding:  EdgeInsets.only(left: 5.w, right: 3.w),
                      decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Delever To',
                                style: Themes.subtitestyle(
                                    context: context,
                                    defaultValue: 13,
                                    mobilesize: 13,
                                    tabletsize: 18,
                                    desktopsize: 22),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  _currentAddress,
                                  style: Themes.subtitestyle(
                                      context: context,
                                      defaultValue: 18,
                                      mobilesize: 20,
                                      tabletsize: 25,
                                      desktopsize: 30),
                                ),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () => _getCurrentLocation(),
                            child: Container(
                              height: 12.h,
                              width: 12.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue.shade200),
                              child: Center(
                                child: Icon(
                                  Icons.location_on_outlined,
                                  size: 8.w,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Obx(() {
                  if (widget.appController.order.isEmpty) {
                    return const SizedBox();
                  } else {
                    return SizedBox(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          height: 48.h,
                          child: ListView.builder(
                            itemCount: widget.appController.order.length,
                            itemBuilder: (_, index) {
                              var ordermenu = widget.appController.order[index];
                              return OrderCard(
                                ordermenu: ordermenu,
                                color: widget.color_list[index % 4],
                                appController: widget.appController,
                                index: index,
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }
                }),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 15.h,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Price',
                                style: Themes.bodystyle(
                                    context: context,
                                    defaultValue: 18,
                                    mobilesize: 18,
                                    tabletsize: 21,
                                    desktopsize: 25),
                              ),
                              Obx(() {
                                return Text(
                                  widget.appController.totalprie == 0
                                      ? '\$ 0,00'
                                      : '\$ ' +
                                          widget.appController.totalprie
                                              .toString(),
                                  style: Themes.headinstyle(
                                      context: context,
                                      defaultValue: 18,
                                      mobilesize: 20,
                                      tabletsize: 25,
                                      desktopsize: 28),
                                );
                              }),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 18.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.yellow.shade600),
                              child: Center(
                                child: Icon(
                                  Icons.payment,
                                  size: 5.h,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
