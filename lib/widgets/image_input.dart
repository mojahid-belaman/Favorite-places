import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onSelectImage});

  final void Function(File img) onSelectImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    try {
      final pickedImg = ImagePicker();
      final img =
          await pickedImg.pickImage(source: ImageSource.camera, maxWidth: 500);

      if (img == null) return;

      setState(() {
        _selectedImage = File(img.path);
      });

      widget.onSelectImage(_selectedImage!);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      icon: const Icon(Icons.camera),
      label: const Text('Take Picture'),
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
    );
    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      );
    }
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3)),
        ),
        height: 200,
        width: double.infinity,
        child: content);
  }
}
