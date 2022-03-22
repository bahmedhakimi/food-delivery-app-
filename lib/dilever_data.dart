// ignore_for_file: non_constant_identifier_names, constant_identifier_names, unnecessary_const

import 'package:delivery_app/model/deliver.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const Delivery = [
  const Deliver(
      id: 1,
      image: 'images/person.jpeg',
      phone: '+213558763222',
      position: LatLng(32.462119, 3.690400),
      username: 'Hakim Mahrez',
      ordercode: 'M158633'),
  const Deliver(
      id: 1,
      image: 'images/person.jpeg',
      phone: '+213698345967',
      position: LatLng(36.649417, 3.339251),
      username: 'Walid Abdeli',
      ordercode: 'M158986'),
  const Deliver(
      id: 1,
      image: 'images/person.jpeg',
      phone: '+213556353522',
      position: LatLng(36.753202, 5.083288),
      username: 'Abdou Hakimi',
      ordercode: 'M158253')
];
