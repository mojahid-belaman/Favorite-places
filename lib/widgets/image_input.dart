import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    final img = await ImagePicker().pickImage(source: ImageSource.camera);

    if (img == null) {
      return;
    }

    setState(() {
      _selectedImage = File(img.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      icon: const Icon(Icons.camera),
      label: const Text('Take Picture'),
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
    );
    if (_selectedImage != null) {
      content = Image.file(
        _selectedImage!,
        fit: BoxFit.cover,
        width: double.infinity,
      );
    }
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3)),
        ),
        height: 250,
        width: double.infinity,
        child: content);
  }
}
