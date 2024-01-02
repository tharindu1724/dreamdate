import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mydatingapp/controllers/auth_controller.dart';

class SignInProvider extends ChangeNotifier {
  final TextEditingController _signInUsernameController =
      TextEditingController();
  TextEditingController get userSigninController => _signInUsernameController;
  final TextEditingController _signInPasswordController =
      TextEditingController();
  TextEditingController get userPasswordController => _signInPasswordController;
  final TextEditingController _resetController = TextEditingController();
  TextEditingController get resetController => _resetController;

  AuthController authController = AuthController();

  Future<void> startLogIn() async {
    if (_signInUsernameController.text.isNotEmpty &&
        _signInPasswordController.text.isNotEmpty) {
      authController.logInUserAccount(
          email: _signInUsernameController.text,
          password: _signInPasswordController.text);
    } else {
      Logger().e("please enter email and password");
    }
  }

  Future<void> resetPassword(BuildContext context) async {
    if (_resetController.text.isNotEmpty) {
      authController.passwordResetAccount(context,
          email: _resetController.text);
      Logger().e("done");
    } else {
      Logger().e("enter the email");
    }
  }
}
