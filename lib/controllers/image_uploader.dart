import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mydatingapp/components/customtext.dart';

class ImageUploader {
  Widget profileImage(BuildContext context) {
    return Stack(
      children: [
        const Center(
          child: CircleAvatar(
            radius: 80.0,
            backgroundImage: AssetImage("assets/images/navpropic.jpg"),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 75,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) => selectPhoto(context),
              );
            },
            child: const Icon(Icons.add_a_photo_outlined),
          ),
        )
      ],
    );
  }

  Widget selectPhoto(BuildContext context) {
    String path = "";

    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          const CustomText(
            text: "Choose a photo",
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async{
                  Image(
                    image: FileImage(File(path)),
                  );
                  final ImagePicker picker = ImagePicker();
                  // Pick an image.
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.camera);
                  image!.path;
                  // Handle camera button press
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: const Icon(Icons.camera),
              ),
              const Text("Camera"),
              TextButton(
                onPressed: () async {
                  Image(
                    image: FileImage(File(path)),
                  );
                  final ImagePicker picker = ImagePicker();
                  // Pick an image.
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  image!.path;
                  // Capture a photo.
                  // Handle gallery button press
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: const Icon(Icons.image),
              ),
              const Text("Gallery"),
            ],
          )
        ],
      ),
    );
  }
}
