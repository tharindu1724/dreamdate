import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mydatingapp/models/user_model.dart';

class PersonController extends GetxController {
  final Rx<List<UserModel>> personProfileList = Rx<List<UserModel>>([]);
  List<UserModel> get allPersonProfileList => personProfileList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    personProfileList.bindStream(FirebaseFirestore.instance
        .collection("users")
        .where("id", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((QuerySnapshot queryDataSnapshot) {
      List<UserModel> personList = [];

      for (var eachProfile in queryDataSnapshot.docs) {
        personList.add(UserModel.fromJson(eachProfile as Map<String, dynamic>));
      }
      return personList;
    }));
  }
}
