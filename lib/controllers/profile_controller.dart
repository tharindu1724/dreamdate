import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:mydatingapp/models/profile_model.dart';

class ProfileDataController {
  CollectionReference profileCollection =
      FirebaseFirestore.instance.collection('profile');

  // late Rx<File?> pickedFile;

  XFile? imageFile;

  Future<String> uploadImageToStorage(File imageFile) async {
    Reference referenceStorage = FirebaseStorage.instance
        .ref()
        .child("profile")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask task = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await task;
    String downloadedImageURl = await snapshot.ref.getDownloadURL();
    return downloadedImageURl;
  }

  profileData(
      File imageProfile,
      String name,
      String age,
      String gender,
      String city,
      String country,
      String lookingForPartner,
      String height,
      String weight,
      String bodyType,
      String drinks,
      String smoke,
      String marriageStatus,
      String haveChildren,
      String noOfChildren,
      String profession,
      String income,
      String partnerLookingFor,
      String family,
      String hobbies,
      String religion,
      String nationality,
      String education,
      String languages) async {
    try {
      //image save
      String urlOfDownloadedImage = await uploadImageToStorage(imageProfile);

      //details save
      ProfileModel profile = ProfileModel(
          imageProfile: urlOfDownloadedImage,
          name: name,
          age: age,
          gender: gender,
          city: city,
          country: country,
          lookingForPartner: lookingForPartner,
          height: height,
          weight: weight,
          bodyType: bodyType,
          drinks: drinks,
          smoke: smoke,
          marriageStatus: marriageStatus,
          haveChildren: haveChildren,
          noOfChildren: noOfChildren,
          profession: profession,
          income: income,
          partnerLookingFor: partnerLookingFor,
          family: family,
          hobbies: hobbies,
          religion: religion,
          nationality: nationality,
          education: education,
          languages: languages);

      await FirebaseFirestore.instance
          .collection("profile")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(profile.profileToJson());
    } catch (e) {
      Logger().e("error $e");
    }
  }
}
