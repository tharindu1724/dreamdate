import 'package:flutter/material.dart';
import 'package:mydatingapp/components/customTextfield.dart';
import 'package:mydatingapp/components/customtext.dart';
import 'package:mydatingapp/providers/signin_provider.dart';
import 'package:provider/provider.dart';

class ResetPw extends StatefulWidget {
  const ResetPw({super.key});

  @override
  State<ResetPw> createState() => _ResetPwState();
}

class _ResetPwState extends State<ResetPw> {
  TextEditingController resetpw = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SafeArea(
        child: Consumer<SignInProvider>(builder: (context, value, child) {
          return Column(
            children: [
              const Padding(padding: EdgeInsets.all(130)),
              const BackButton(),
              CustomTextField(
                controller: value.resetController,
                icon: Icons.mail,
                screenWidth: screenWidth * 1.20,
                text: "Email",
                isPassword: false,
              ),
              const SizedBox(height: 30),
              Container(
                height: screenWidth * 0.20,
                width: screenWidth * 0.75,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 40, 42, 43),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      value.resetPassword(context);
                    },
                    child: const CustomText(
                        text: "Reset Password",
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
