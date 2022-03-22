// ignore_for_file: unused_element, non_constant_identifier_names, avoid_unnecessary_containers, unused_field, avoid_print, unrelated_type_equality_checks

import 'package:delivery_app/controller/controller.dart';
import 'package:delivery_app/page/detail.dart';
import 'package:delivery_app/page/map.dart';
import 'package:delivery_app/page/mycart.dart';
import 'package:delivery_app/theme/theme.dart';
import 'package:delivery_app/widget/menucard.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:responsive_framework/responsive_framework.dart' as responsive;
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int select_index = -1;
  int _currentIndex = 0;
  final AppController appController = Get.put(AppController());

  _determinePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    //return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    _determinePermission();
  }

  @override
  Widget build(BuildContext context) {
/*     print(_currentAddress);
 */
    responsive_value(
        {double? defaultValue,
        double? mobilesize,
        double? tabletsize,
        double? desktopsize}) {
      return responsive.ResponsiveValue(
        context,
        defaultValue: defaultValue,
        valueWhen: [
          responsive.Condition.smallerThan(
            name: responsive.MOBILE,
            value: mobilesize,
          ),
          responsive.Condition.smallerThan(
            name: responsive.TABLET,
            value: tabletsize,
          ),
          responsive.Condition.smallerThan(
            name: responsive.DESKTOP,
            value: tabletsize,
          )
        ],
      ).value;
    }

    List<Color> colors = [
      Colors.red,
      Colors.amber,
      Colors.green,
      Colors.orange
    ];

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                        iconSize: responsive_value(
                            defaultValue: 25,
                            mobilesize: 20,
                            tabletsize: 30,
                            desktopsize: 40)!),
                    CircleAvatar(
                      backgroundImage: const AssetImage('images/dish.png'),
                      radius: responsive_value(
                          defaultValue: 20,
                          mobilesize: 13,
                          tabletsize: 18,
                          desktopsize: 20),
                    )
                  ],
                ),
              ),
              Text(
                'Good Food.\n Fast Delivery.',
                style: Themes.headinstyle(
                    context: context,
                    defaultValue: 20,
                    mobilesize: 25,
                    tabletsize: 30,
                    desktopsize: 40),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List<Widget>.generate(appController.category_meal.length,
                        (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            select_index = index;
                          });
                          appController.order_type.clear();
                          appController.gettype(select_index);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 16.w,
                              height: 10.h,
                              decoration: BoxDecoration(
                                  color: index == select_index
                                      ? colors[index]
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Image.asset(
                                  appController.category_meal[index].image,
                                  width: 13.w,
                                  height: 10.h,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Text(
                              appController.category_meal[index].title,
                              style: Themes.headinstyle(
                                  context: context,
                                  defaultValue: 13,
                                  mobilesize: 13,
                                  tabletsize: 18,
                                  desktopsize: 20),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height:
                    SizerUtil.orientation == Orientation.portrait ? 3.h : 1.5.h,
              ),
              if (appController.order_type == null)
                Text(
                  'Popular Now',
                  style: Themes.headinstyle(
                      context: context,
                      defaultValue: 15,
                      mobilesize: 15,
                      tabletsize: 18,
                      desktopsize: 25),
                ),
              Expanded(
                child: Obx(() {
                  if (appController.order_type.isEmpty) {
                    return SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'A Moments of Delivered on Time',
                            style: Themes.bodystyle(
                                context: context,
                                defaultValue: 15,
                                mobilesize: 18,
                                tabletsize: 22,
                                desktopsize: 25),
                          ),
                          Text(
                            'Fasty',
                            style: Themes.headinstyle(
                                context: context,
                                defaultValue: 10,
                                mobilesize: 25,
                                tabletsize: 30,
                                desktopsize: 35),
                          ),
                          Container(
                            height: 35.h,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/111.png'),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: SizedBox(
                        height: 40.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: appController.order_type.length,
                          itemBuilder: (_, index) {
                            var menu = appController.order_type[index];
                            return GestureDetector(
                                onTap: () {
                                  Get.to(() => Detail(
                                      menu: menu,
                                      appController: appController));
                                },
                                child: MenuCard(
                                  menu: menu,
                                  color: colors[index % 4],
                                ));
                          },
                        ),
                      ),
                    );
                  }
                }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() => _currentIndex = i);
          if (_currentIndex == 1) {
            Get.to(() => MyCart(
                  appController: appController,
                  color_list: colors,
                ));
          }
          if (_currentIndex == 2) {
            Get.to(() => MapPage(
                  appController: appController,
                ));
          }
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.payment),
            title: const Text("Card"),
            selectedColor: Colors.teal,
          ),

          /// delivry
          SalomonBottomBarItem(
            icon: const Icon(Icons.delivery_dining),
            title: const Text("delivery"),
            selectedColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}
