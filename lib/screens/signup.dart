import 'package:flutter/material.dart';
import 'package:mydatingapp/components/customContainer.dart';
import 'package:mydatingapp/components/customTextfield.dart';
import 'package:mydatingapp/components/customtext.dart';
import 'package:mydatingapp/providers/signup_provider.dart';
import 'package:mydatingapp/screens/signin.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController createEmail = TextEditingController();
  TextEditingController createPassword = TextEditingController();
  TextEditingController createUsername = TextEditingController();
  TextEditingController createConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Consumer<SignupProvider>(builder: (context, value, child) {
            return Column(
              children: [
                const Padding(padding: EdgeInsets.all(15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logotest.png",
                      width: 150,
                      height: 150,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomText(
                    text: "DreamDate",
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.pink.shade500),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: value.emailController,
                  icon: Icons.mail,
                  screenWidth: screenWidth * 1.05,
                  text: "Email",
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: value.nameController,
                  icon: Icons.man_2_rounded,
                  screenWidth: screenWidth * 1.05,
                  text: "Username",
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: value.passwordController,
                  icon: Icons.password_sharp,
                  screenWidth: screenWidth * 1.05,
                  text: "Password",
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: value.confirmPasswordController,
                  icon: Icons.password_sharp,
                  screenWidth: screenWidth * 1.05,
                  text: "Confirm Password",
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    value.startCreateAccount();
                  },
                  child: CustomContainer(
                      text: "Sign up",
                      borderRadius: BorderRadius.circular(40),
                      screenWidth: screenWidth),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignIn()));
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Log in  now',
                          style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.orange.shade400),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
