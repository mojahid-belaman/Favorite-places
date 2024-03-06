import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceLocation {
  const PlaceLocation(
      {required this.lat, required this.lon, required this.address});

  final double lat;
  final double lon;
  final String address;
}

class Place {
  Place({required this.title, required this.image, this.location})
      : id = uuid.v4();

  final String id;
  final String title;
  final File? image;
  final PlaceLocation? location;
}
