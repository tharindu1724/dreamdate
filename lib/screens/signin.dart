import 'package:flutter/material.dart';
import 'package:mydatingapp/components/customContainer.dart';
import 'package:mydatingapp/components/customTextfield.dart';
import 'package:mydatingapp/components/customtext.dart';
import 'package:mydatingapp/providers/signin_provider.dart';
import 'package:mydatingapp/screens/resetpassword.dart';
import 'package:mydatingapp/screens/signup.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Consumer<SignInProvider>(builder: (context, value, child) {
            return Column(
              children: [
                const Padding(padding: EdgeInsets.all(25)),
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
                const SizedBox(height: 10),
                const CustomText(
                    text: "let's choose your match",
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: value.userSigninController,
                  icon: Icons.mail,
                  screenWidth: screenWidth * 1.05,
                  text: "Username or Email",
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: value.userPasswordController,
                  icon: Icons.password,
                  screenWidth: screenWidth * 1.05,
                  text: "Password",
                  isPassword: true,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (val) {}),
                    const CustomText(
                        text: "Remember me",
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    const Spacer(flex: 1),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ResetPw()));
                      },
                      child: CustomText(
                        text: "forget password",
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.orange.shade400,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    value.startLogIn();
                  },
                  child: CustomContainer(
                      text: "Login",
                      borderRadius: BorderRadius.circular(40),
                      screenWidth: screenWidth),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Dont you have an account? ',
                      style: const TextStyle(fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Sign up  now',
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
