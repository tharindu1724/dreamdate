import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:mydatingapp/controllers/user_data_controller.dart';
import 'package:mydatingapp/models/user_model.dart';
import 'package:mydatingapp/screens/home.dart';
import 'package:mydatingapp/screens/mainpage.dart';

//check the login
class AuthController extends GetxController {
  static AuthController authController = Get.find();

  Future<void> listenToAuthState(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Logger().e("user currently signed out");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      } else {
        Logger().e('User is signed in!');
        UserModel data =
            await UserDataController().fetchData(user.uid).then((value) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
          return value;
        });
        Logger().f(data.toJson());
      }
    });
  }

//sign up with email and password function
  Future<void> createUserAccount(
      {required email, required password, required username}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await value.user!.updateDisplayName(username);
        UserModel user = UserModel(
            username: username,
            email: value.user!.email ?? "",
            id: value.user!.uid);
        UserDataController().savedData(user);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Logger().e('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Logger().e('The account already exists for that email.');
      }
    } catch (e) {
      Logger().e(e);
    }
  }

//login with email and password function
  Future<void> logInUserAccount({required email, required password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Logger().e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Logger().e('Wrong password provided for that user.');
      }
    }
  }

  //logout function
  Future<void> logOutUserAccount() async {
    await FirebaseAuth.instance.signOut();
  }

  //reset password
  Future<void> passwordResetAccount(BuildContext context,
      {required email}) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) => Navigator.pop(context));
    } catch (e) {
      Logger().e("did not send");
    }
  }

//Signin with google
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

//signin with fb
  // Future<UserCredential> signInWithFacebook() async {
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken.token);

  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  //save data to database
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> savedData(UserModel model) async {
    await userCollection.doc(model.id).set(model.toJson());
  }



   //second option
  //image uploadder

  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;

  XFile? imageFile;

  pickedImageFileFromGallery() async {
     imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      Logger().f("successfull select the image");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  pickedImageFileFromCamera() async {
     imageFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      Logger().f("successfull select the image");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }
}
 