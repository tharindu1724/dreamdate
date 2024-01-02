import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mydatingapp/components/customContainer.dart';
import 'package:mydatingapp/components/customTextfield.dart';
import 'package:mydatingapp/controllers/auth_controller.dart';
import 'package:mydatingapp/providers/profile_data_provider.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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

  var authController = AuthController.authController;

  @override
  Widget build(BuildContext context) {
    ProfileDataProvider profileDataProvider = ProfileDataProvider();
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.pink.shade300,
      body: SingleChildScrollView(
        child: Consumer<ProfileDataProvider>(builder: (context, value, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Stack(
                  children: [
                    authController.imageFile == null
                        ? const CircleAvatar(
                            radius: 80.0,
                            backgroundImage:
                                AssetImage("assets/images/navpropic.jpg"),
                          )
                        : Container(
                            height: 3000,
                            width: 300,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: FileImage(
                                        File(authController.imageFile!.path)))),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            setState(() {
                              authController.imageFile;
                            });
                            await authController.pickedImageFileFromGallery();
                          },
                          icon: const Icon(Icons.camera),
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          onPressed: () async {
                            setState(() {
                              authController.imageFile;
                            });
                            await authController.pickedImageFileFromCamera();
                          },
                          icon: const Icon(Icons.browse_gallery),
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "Name",
                  icon: Icons.person,
                  controller: nameController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "age",
                  icon: Icons.numbers_sharp,
                  controller: ageController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "gender",
                  icon: Icons.male,
                  controller: genderController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "city",
                  icon: Icons.location_city_rounded,
                  controller: cityController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "country",
                  icon: Icons.flag,
                  controller: countryController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "looking for partner",
                  icon: Icons.beach_access_outlined,
                  controller: lookingForPartnerController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "weight",
                  icon: Icons.numbers,
                  controller: weightController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "height",
                  icon: Icons.numbers,
                  controller: heightController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "bodytype",
                  icon: Icons.shape_line,
                  controller: bodyTypeController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "drinks",
                  icon: Icons.water,
                  controller: drinksController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "smoke",
                  icon: Icons.smoke_free,
                  controller: smokeController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "marriage status",
                  icon: Icons.girl,
                  controller: marriageStatusController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "profession",
                  icon: Icons.badge,
                  controller: professionController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "have or not children",
                  icon: Icons.child_care,
                  controller: haveChildrenController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "no of children",
                  icon: Icons.numbers,
                  controller: noOfChildrenController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "income",
                  icon: Icons.money,
                  controller: incomeController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "partner Looking For",
                  icon: Icons.person,
                  controller: partnerLookingForController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "family",
                  icon: Icons.family_restroom,
                  controller: familyController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "hobbies",
                  icon: Icons.featured_play_list,
                  controller: hobbiesController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "religion",
                  icon: Icons.title,
                  controller: religionController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "education",
                  icon: Icons.cast_for_education,
                  controller: educationController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "nationality",
                  icon: Icons.flag_circle_sharp,
                  controller: nationalityController),
              const SizedBox(height: 10),
              CustomTextField(
                  screenWidth: screenWidth,
                  text: "languages",
                  icon: Icons.language,
                  controller: languagesController),
              const SizedBox(height: 20),
              GestureDetector(
                  onTap: () {
                    profileDataProvider
                        .saveProfileDate()
                        .then((value) => Navigator.pop(context));
                  },
                  child: CustomContainer(
                      text: "Submit",
                      borderRadius: BorderRadius.circular(40),
                      screenWidth: screenWidth))
            ],
          );
        }),
      ),
    );
  }
}
