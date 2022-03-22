// ignore_for_file: unused_element

import 'package:delivery_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryCard extends StatefulWidget {
  final delivery;
  const DeliveryCard({required this.delivery});

  @override
  State<DeliveryCard> createState() => _DeliveryCardState();
}

class _DeliveryCardState extends State<DeliveryCard> {
  String address = '';
  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          widget.delivery.position.latitude,
          widget.delivery.position.longitude);

      Placemark place = p[0];

      setState(() {
        address =
            "${place.locality},${place.administrativeArea.toString().split(' ')[0]},${place.country}";
        print(address);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    _getAddressFromLatLng();
    return Container(
      height: SizerUtil.deviceType == DeviceType.mobile ? 25.h : 28.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue.shade200, borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(left: 2.w, right: 2.w, bottom: 2.h),
      padding: EdgeInsets.only(right: 2.w, left: 2.w, top: 1.h, bottom: 1.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.delivery.image),
                    radius: 4.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    widget.delivery.username,
                    style: Themes.headinstyle(
                        context: context,
                        defaultValue: 15,
                        mobilesize: 20,
                        tabletsize: 22,
                        desktopsize: 25),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        launch(('tel://${widget.delivery.phone}'));
                      },
                      icon: Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 3.h,
                      )),
                ),
              )
            ],
          ),
          const Divider(
            color: Colors.white,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.orange,
                      size: 3.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          address,
                          style: Themes.headinstyle(
                              context: context,
                              defaultValue: 15,
                              mobilesize: 15,
                              tabletsize: 17,
                              desktopsize: 20),
                        ),
                        Text(
                          'Delivery Adress',
                          style: Themes.subtitestyle(
                              context: context,
                              defaultValue: 10,
                              mobilesize: 10,
                              tabletsize: 12,
                              desktopsize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.add_shopping_cart_outlined,
                        color: Colors.orange,
                        size: 3.h,
                      ),
                      Column(
                        children: [
                          Text(
                            widget.delivery.ordercode,
                            style: Themes.headinstyle(
                                context: context,
                                defaultValue: 15,
                                mobilesize: 15,
                                tabletsize: 16,
                                desktopsize: 18),
                          ),
                          Text(
                            'Order Code',
                            style: Themes.subtitestyle(
                                context: context,
                                defaultValue: 12,
                                mobilesize: 10,
                                tabletsize: 12,
                                desktopsize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      String lat = widget.delivery.position.latitude.toString();
                      String long =
                          widget.delivery.position.longitude.toString();
                      String url = 'https://maps.google.com/?q=$lat,$long';
                      print(url);
                      try {
                        await canLaunch(url)
                            ? await launch(url,
                                forceWebView: false, enableJavaScript: true)
                            : throw "can't launch url";
                        // ignore: empty_catches
                      } catch (e) {
                        setState(() {
                          e.toString();
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.amber.shade300,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Delivery',
                        textAlign: TextAlign.center,
                        style: Themes.subtitestyle(
                            context: context,
                            defaultValue: 15,
                            mobilesize: 15,
                            tabletsize: 16,
                            desktopsize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
