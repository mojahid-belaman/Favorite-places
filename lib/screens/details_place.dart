import 'package:favorite_places/modals/place.dart';
import 'package:flutter/material.dart';

class DetailsPlace extends StatelessWidget {
  const DetailsPlace({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Center(
        child: Text(place.title),
      ),
    );
  }
}
