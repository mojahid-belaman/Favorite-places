import 'package:flutter/material.dart';

import 'package:favorite_places/modals/place.dart';
import 'package:favorite_places/screens/details_place.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: FileImage(places[index].image!),
        ),
        title: Text(
          places[index].title,
          style: ThemeData()
              .textTheme
              .bodyLarge!
              .copyWith(color: ThemeData().colorScheme.onPrimary, fontSize: 18),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return DetailsPlace(
                  place: places[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
