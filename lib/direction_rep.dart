// ignore_for_file: unused_field

import 'package:delivery_app/model/direction.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class DirectionRepository {
  //static const String url = 'https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf6248664b1febd76c41e38c122812cc5d326f&start=8.681495,49.41461&end=8.687872,49.420318';
  final String apiKey =
      '5b3ce3597851110001cf6248664b1febd76c41e38c122812cc5d326f';
  final String pathParam = 'driving-car';
  DirectionRepository();

  Future getDirections(
      {required LatLng origin, required LatLng distination}) async {
    /*  final responce = await http.get(Uri.parse(
        '$url?api_key=$apiKey&start=${origin.longitude},${origin.latitude}&end=${distination.longitude},${distination.latitude}'));
    print(responce.statusCode);

    if (responce.statusCode == 200) {
      responce.body;
      
      return Directions.fromMap(responce.body);
    } else {
      return null;
    } */
    const String url =
        'comgooglemaps://+?saddr=34.4908445,3.6744980&daddr=32.4908445,3.6744955&directionsmode=driving';

    if (!await launch(url, forceWebView: true, enableJavaScript: true)) {
      throw 'Could not launch $url';
    }
  }
}
