// ignore_for_file: prefer_const_declarations, prefer_const_constructors, unused_field, prefer_final_fields, prefer_collection_literals, prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:delivery_app/widget/deliverycard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  final appController;
  const MapPage({required this.appController});

  @override
  State<MapPage> createState() => _MapState();
}

class _MapState extends State<MapPage> {
  /* Completer<GoogleMapController> _controller = Completer();
  Marker? origine;
  Marker? destination;
  Directions? info;
  final OpenRouteService client = OpenRouteService(
      apiKey: '5b3ce3597851110001cf6248664b1febd76c41e38c122812cc5d326f');

  // Object for PolylinePoints

// List of coordinates to join

// Map storing polylines created by connecting two points
  Map<PolylineId, Polyline> polylines = {};

  List<LatLng> polylineCoordinates = [];
  Set<Polyline> _polylines = Set<Polyline>();
  late PolylinePoints polylinePoints; */

  /*  static final _initialCameraPosition = CameraPosition(
    target: LatLng(31.944704, 3.096298),
    zoom: 11.4746,
  ); */
  @override
  void initState() {
    super.initState();
    // polylinePoints = PolylinePoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Colors.amber.shade800),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_sharp, size: 6.w),
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 80.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          opacity: 0.5,
                          image: AssetImage('images/2954453.jpg')),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45))),
                  margin: EdgeInsets.only(top: 35.h),
                  padding: EdgeInsets.only(
                    top: 2.h,
                    right: 1.w,
                    left: 2.w,
                  ),
                  child: (widget.appController.delivery.isEmpty)
                      ? const SizedBox()
                      : SingleChildScrollView(
                          child: SizedBox(
                            height: 60.h,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: widget.appController.delivery.length,
                              itemBuilder: (_, index) {
                                var delivery =
                                    widget.appController.delivery[index];
                                return GestureDetector(
                                    onTap: () {
                                      //Get.to();
                                    },
                                    child: DeliveryCard(
                                      delivery: delivery,
                                    ));
                              },
                            ),
                          ),
                        )),
              Positioned(
                left: 5.w,
                right: 5.w,
                child: SizedBox(
                  width: 40.w,
                  height: 40.h,
                  child: Image.asset(
                    'images/delivery.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      /* GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        mapType: MapType.normal,
        myLocationEnabled: true,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        onMapCreated: (controller) {
          _controller.complete(controller);
          /* showpinsonmap();
          setpolyliness(); */
        },
        markers: {
          if (origine != null) origine!,
          if (destination != null) destination!
        },
        onTap: addmarker,
        polylines: _polylines,
      ), */
    );
  }

/*   void addmarker(LatLng pos) async {
    Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      setState(() {
        origine = Marker(
            markerId: MarkerId('origin'),
            infoWindow: InfoWindow(title: 'origin'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            position: LatLng(34.4908445, 3.6744980));
      });
    });

    setState(() {
      destination = Marker(
          markerId: MarkerId('destination'),
          infoWindow: InfoWindow(title: 'destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: LatLng(32.4908445, 3.6744955));
    });
  } */

  void getdirection() async {
    const String url =
        'https://maps.google.com/?q=27.902563224886897,-0.28774705098887626';
    print(url);
    try {
      await canLaunch(url)
          ? await launch(url, forceWebView: false, enableJavaScript: true)
          : throw "can't launch url";
      // ignore: empty_catches
    } catch (e) {
      setState(() {
        e.toString();
      });
    }

    //setpolyliness();
    // Generating the list of coordinates to be used for
    // drawing the polylines
    /*  PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyDkjoy-5wSCzhRiMiswQavSYJKEAKECob8', // Google Maps API Key
      PointLatLng(33.4908445, 3.6744970),
      PointLatLng(31.4908445, 3.6744955),
      travelMode: TravelMode.driving,
    );
    print(result.status);
    if (result.status == 'OK') {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    setState(() {
      // Defining an ID
      PolylineId id = PolylineId('poly');

      // Initializing Polyline
      Polyline polyline = Polyline(
        polylineId: PolylineId('poly'),
        color: Colors.red,
        points: polylineCoordinates,
        width: 3,
      );

      // Adding the polyline to the map
      polylines[id] = polyline;
    }); */

    /*  await DirectionRepository()
        .getDirections(
            origin: LatLng(34.4908445, 3.6744980),
            distination: LatLng(32.4908445, 3.6744955)); */
  }

/* 
  void setpolyliness() async {
    // Generating the list of coordinates to be used for
    // drawing the polylines

    final List<ORSCoordinate> routeCoordinates =
        await client.directionsRouteCoordsGet(
      profileOverride: ORSProfile.drivingCar,
      startCoordinate:
          ORSCoordinate(latitude: 33.4908445, longitude: 3.6744970),
      endCoordinate: ORSCoordinate(latitude: 31.4908445, longitude: 3.6744955),
    );
    print('routeCoordinates');

    print(routeCoordinates);
    final List<LatLng> routePoints = routeCoordinates
        .map((coordinate) => LatLng(coordinate.latitude, coordinate.longitude))
        .toList();
    setState(() {
      _polylines.add(Polyline(
        polylineId: PolylineId('route'),
        visible: true,
        points: routePoints,
        color: Colors.red,
        width: 4,
      ));
      // Defining an ID
    });
  } */
}
