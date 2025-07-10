import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_commerce_app/widget/app_color.dart';

class ImagePickerWidget extends StatefulWidget {
  final ValueChanged<List<File>>? onImagesChanged;

  const ImagePickerWidget({Key? key, this.onImagesChanged}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final List<File> _imageFiles = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickMultiImages() async {
    final List<XFile> pickedFiles = await _picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      setState(() {
        for (XFile pickedFile in pickedFiles) {
          _imageFiles.add(File(pickedFile.path));
        }

        if (widget.onImagesChanged != null) {
          widget.onImagesChanged!(_imageFiles);
        }
      });
    } else {
      print('The user has not selected any images.');
    }

    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  Future<void> _pickImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFiles.add(File(pickedFile.path));

        if (widget.onImagesChanged != null) {
          widget.onImagesChanged!(_imageFiles);
        }
      });
    } else {
      print('The user has not selected any images.');
    }

    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  void _removeImage(int index) {
    setState(() {
      _imageFiles.removeAt(index);

      if (widget.onImagesChanged != null) {
        widget.onImagesChanged!(_imageFiles);
      }
    });
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  _pickImageFromCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Library'),
                onTap: () {
                  _pickMultiImages();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        ..._imageFiles.asMap().entries.map((entry) {
          int index = entry.key;
          File image = entry.value;
          return Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: FileImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () => _removeImage(index),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: AppColor.whiteColor,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          );
        }).toList(),

        GestureDetector(
          onTap: () {
            _showImageSourceActionSheet(context);
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColor.redColor,
                  radius: 25,
                  child: Icon(
                    Icons.camera_alt,
                    color: AppColor.whiteColor,
                    size: 25,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Add Image',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: AppColor.blackColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
