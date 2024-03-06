import 'dart:io';

import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/modals/place.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/providers/places_provider.dart';

class NewPlace extends ConsumerStatefulWidget {
  const NewPlace({super.key});

  @override
  ConsumerState<NewPlace> createState() {
    return _NewPlaceState();
  }
}

class _NewPlaceState extends ConsumerState<NewPlace> {
  final _formKey = GlobalKey<FormState>();
  File? _selectedImage;
  String? _title;

  void _submitPlace() {
    if (_formKey.currentState!.validate() && _selectedImage != null) {
      _formKey.currentState!.save();
      ref
          .read(placesProvider.notifier)
          .addNewPlace(Place(title: _title!, image: _selectedImage));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: const InputDecoration(label: Text('Title')),
                style: TextStyle(color: ThemeData().colorScheme.onPrimary),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '* required';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _title = newValue!;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ImageInput(
              onSelectImage: (img) {
                _selectedImage = img;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const LocationInput(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: _submitPlace,
                icon: const Icon(Icons.add),
                label: const Text('Add Place'))
          ],
        ),
      ),
    );
  }
}
