import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_commerce_app/widget/app_color.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _imageFile;
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } else {
      print('Người dùng chưa chọn ảnh nào.');
    }
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
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
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
    return GestureDetector(
      onTap: () {
        _showImageSourceActionSheet(context);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _imageFile == null
              ? CircleAvatar(
                  backgroundColor: AppColor.redColor,
                  radius: 20,
                  child: Icon(
                    Icons.camera_alt,
                    color: AppColor.whiteColor,
                    size: 20,
                  ),
                )
              : CircleAvatar(
                  radius: 20,
                  backgroundImage: FileImage(_imageFile!),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: AppColor.redColor,
                      radius: 8,
                      child: Icon(
                        Icons.edit,
                        color: AppColor.whiteColor,
                        size: 10,
                      ),
                    ),
                  ),
                ),
          SizedBox(height: 4),
          Text(
            textAlign: TextAlign.center,
            _imageFile == null ? 'Add your photos' : 'Change photo',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
