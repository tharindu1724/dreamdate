import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mydatingapp/controllers/profile_controller.dart';

class ProfileDataProvider extends ChangeNotifier {
  late File imageFile;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController lookingForPartnerController = TextEditingController();

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bodyTypeController = TextEditingController();

  TextEditingController drinksController = TextEditingController();
  TextEditingController smokeController = TextEditingController();
  TextEditingController marriageStatusController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController haveChildrenController = TextEditingController();
  TextEditingController noOfChildrenController = TextEditingController();
  TextEditingController incomeController = TextEditingController();
  TextEditingController partnerLookingForController = TextEditingController();
  TextEditingController familyController = TextEditingController();
  TextEditingController hobbiesController = TextEditingController();

  TextEditingController religionController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController languagesController = TextEditingController();

  ProfileDataController profileDataController = ProfileDataController();

  Future<void> saveProfileDate() async {
    if (nameController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        genderController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        countryController.text.isNotEmpty &&
        lookingForPartnerController.text.isNotEmpty &&
        heightController.text.isNotEmpty &&
        weightController.text.isNotEmpty &&
        bodyTypeController.text.isNotEmpty &&
        drinksController.text.isNotEmpty &&
        smokeController.text.isNotEmpty &&
        marriageStatusController.text.isNotEmpty &&
        professionController.text.isNotEmpty &&
        haveChildrenController.text.isNotEmpty &&
        noOfChildrenController.text.isNotEmpty &&
        incomeController.text.isNotEmpty &&
        partnerLookingForController.text.isNotEmpty &&
        familyController.text.isNotEmpty &&
        hobbiesController.text.isNotEmpty &&
        religionController.text.isNotEmpty &&
        nationalityController.text.isNotEmpty &&
        educationController.text.isNotEmpty &&
        languagesController.text.isNotEmpty) {


          
      profileDataController.uploadImageToStorage;



      profileDataController.profileData(
          imageFile,
          nameController.text,
          ageController.text,
          genderController.text,
          cityController.text,
          countryController.text,
          lookingForPartnerController.text,
          heightController.text,
          weightController.text,
          bodyTypeController.text,
          drinksController.text,
          smokeController.text,
          marriageStatusController.text,
          haveChildrenController.text,
          noOfChildrenController.text,
          professionController.text,
          incomeController.text,
          partnerLookingForController.text,
          familyController.text,
          hobbiesController.text,
          religionController.text,
          nationalityController.text,
          educationController.text,
          languagesController.text);
    } else {
      Logger().e("fill required details");
    }
  }
}
