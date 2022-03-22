import 'package:google_maps_flutter/google_maps_flutter.dart';

class Deliver {
  final int id;
  final String username;
  final String phone;
  final LatLng position;
  final String image;
  final String ordercode;

  const Deliver({
    required this.id,
    required this.username,
    required this.image,
    required this.phone,
    required this.position,
    required this.ordercode,
  });
}
