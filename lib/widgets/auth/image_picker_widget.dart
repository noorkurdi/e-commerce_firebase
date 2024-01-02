import 'dart:developer';
import 'dart:io';

import 'package:firebase_test/core/enums/image_picker_enum.dart';
import 'package:firebase_test/core/utils/media_query_values.dart';
import 'package:firebase_test/providers/auth/register_provider.dart';
import 'package:firebase_test/providers/image_picker_provider.dart';
import 'package:firebase_test/services/my_app_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final imagePickerProvider = Provider.of<ImagePickerProvider>(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: imagePickerProvider.pickedImage == null
                ? Container(
                    height: context.width * .23,
                    width: context.width * .23,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const FittedBox(
                      child: Icon(
                        Icons.person,
                      ),
                    ),
                  )
                : SizedBox(
                    width: context.width * .23,
                    height: context.width * .23,
                    child: Image.file(
                      File(imagePickerProvider.pickedImage!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: context.width * .21,
          child: FittedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Material(
                color: Colors.blue.shade100,
                child: IconButton(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () async {
                    await AppFunctions.pickImageDialog(
                      context: context,
                      cameraFun: () {
                        imagePickerProvider.imagePick(ImagePickerEnum.camera);
                      },
                      galleryFun: () {
                        imagePickerProvider.imagePick(ImagePickerEnum.gallery);
                      },
                      removeFun: () {
                        imagePickerProvider.imagePick(ImagePickerEnum.remove);
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.add_a_photo_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
