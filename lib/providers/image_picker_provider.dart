import 'package:firebase_test/core/enums/image_picker_enum.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  XFile? _pickedImage;

  ////////ENUMS/////////

  Future<void> imagePick(ImagePickerEnum imagePickerEnum) async {
    final ImagePicker imagePicker = ImagePicker();
    switch (imagePickerEnum) {
      case ImagePickerEnum.camera:
        _pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
        notifyListeners();
        break;
      case ImagePickerEnum.gallery:
        _pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
        notifyListeners();
        break;
      case ImagePickerEnum.remove:
        _pickedImage = null;
        notifyListeners();
        break;
    }
  }

  XFile? get pickedImage {
    return _pickedImage;
  }
}
