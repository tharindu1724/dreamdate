
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mydatingapp/controllers/auth_controller.dart';

class SignupProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  AuthController authController = AuthController();

  Future<void> startCreateAccount() async {
    if (_emailController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty) {
      if (_passwordController.text == _confirmPasswordController.text) {
        authController.createUserAccount(
          
            
            username: _nameController.text,
            email: _emailController.text,
            password: _passwordController.text);
      } else {
        Logger().e("passwords are not matched");
      }
    } else {
      Logger().e("please fill all");
    }
  }
}
