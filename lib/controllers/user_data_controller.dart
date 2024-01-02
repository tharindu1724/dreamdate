import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:mydatingapp/models/user_model.dart';

class UserDataController {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> savedData(UserModel model) async {
    await userCollection.doc(model.id).set(model.toJson()).then((value) {
      Logger().f("data saved successfully");
    });
  }

  Future<UserModel> fetchData(String id) async {
    DocumentSnapshot data = await userCollection.doc(id).get();
    return UserModel.fromJson(data.data() as Map<String, dynamic>);
  }
}
