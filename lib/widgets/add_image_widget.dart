import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class DynamicImageWidget extends StatefulWidget {
  final double maxWidth; // maximum width to fit the image within
  final double maxHeight; // maximum height to fit the image within

  DynamicImageWidget({Key? key, this.maxWidth = 300, this.maxHeight = 300}) : super(key: key);

  @override
  _DynamicImageWidgetState createState() => _DynamicImageWidgetState();
}

class _DynamicImageWidgetState extends State<DynamicImageWidget> {
  Uint8List? _imageBytes;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: _imageBytes != null
          ? Image.memory(
              _imageBytes!,
              width: widget.maxWidth,
              height: widget.maxHeight,
              fit: BoxFit.contain,
            )
          : Container(
              width: widget.maxWidth,
              height: widget.maxHeight,
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  'Tap to select image',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
    );
  }
}
