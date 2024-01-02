import 'package:flutter/material.dart';
import 'package:mydatingapp/components/customContainer.dart';
import 'package:mydatingapp/components/customtext.dart';
import 'package:mydatingapp/controllers/auth_controller.dart';
import 'package:mydatingapp/screens/signin.dart';
import 'package:mydatingapp/screens/signup.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthController authController = AuthController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logotest.png",
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "DreamDate",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.pink.shade500),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomText(
                  text: "Welcome to the Dream Date",
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.pink.shade500),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                text: "Lets get Started",
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  authController.signInWithGoogle();
                },
                child: CustomContainer(
                    text: "Continue with google",
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromARGB(255, 40, 42, 43),
                    screenWidth: screenWidth),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  //authController.signInWithFacebook();
                },
                child: CustomContainer(
                    text: "Continue with Facebook",
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromARGB(255, 40, 42, 43),
                    screenWidth: screenWidth),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignIn()));
                },
                child: CustomContainer(
                    text: "Continue with Email",
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromARGB(255, 40, 42, 43),
                    screenWidth: screenWidth),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: screenWidth * 0.45,
                height: 1,
                color: Colors.white,
              ),
              const CustomText(
                  text: "or",
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
              Container(
                width: screenWidth * 0.45,
                height: 1,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              const CustomText(
                  text: "Dont you have account?",
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const CustomText(
                  text: "Sign up for free",
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
