import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/modals/place.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super(const []);

  void addNewPlace(Place place) {
    state = [place, ...state];
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<Place>>(
    (ref) => PlacesNotifier());
