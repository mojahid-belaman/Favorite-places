import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/screens/new_place.dart';
import 'package:favorite_places/providers/places_provider.dart';
import 'package:favorite_places/widgets/place_list.dart';

class Places extends ConsumerWidget {
  const Places({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(placesProvider);
    Widget content = Center(
      child: Text(
        'No places added yet!',
        style: ThemeData()
            .textTheme
            .bodyLarge!
            .copyWith(color: ThemeData().colorScheme.onPrimary, fontSize: 18),
      ),
    );

    if (places.isNotEmpty) {
      content = PlaceList(
        places: places,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return const NewPlace();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: content,
    );
  }
}
