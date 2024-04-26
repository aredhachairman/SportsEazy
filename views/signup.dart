import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/customtext.dart';

import 'package:flutter_application_1/views/customButton.dart';
import 'package:flutter_application_1/views/customtextField.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isPasswordVisible = false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 33, 86, 1),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 70, 16, 19),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: screenWidth,
              child: Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.2, left: 15, right: 15),
                child: Container(
                  height: 600,
                  width: 385,
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(113, 39, 45, 0.298),
                        offset: Offset(0, 6),
                        blurRadius: 12,
                        spreadRadius: 6,
                      ),
                    ],
                    color: Color.fromRGBO(234, 181, 181, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: CustomText(
                            label: 'Create account',
                            fontsize: 25,
                            fontWeight: FontWeight.bold,
                            labelcolor: Colors.black,
                          ),
                        ),
                        CustomTextField(
                          controller: usernameController,
                          hintText: "Enter Username",
                          prefixIcon: Icon(Icons.person),
                          suffixIcon: Icon(null),
                        ),
                        CustomTextField(
                          controller: emailController,
                          hintText: "Enter Email",
                          prefixIcon: Icon(Icons.person),
                          suffixIcon: Icon(null),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: passwordController,
                          hintText: "Enter Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          obscureText: !isPasswordVisible,
                          togglePasswordVisibility: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        CustomTextField(
                          controller: confirmpasswordController,
                          hintText: "Confirm Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          togglePasswordVisibility: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          obscureText: !isPasswordVisible,
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          onPressed: () {},
                          label: ("Sign Up"),
                          buttonColor: Color.fromARGB(255, 139, 44, 52),
                          width: 25,
                          action: navigateToDashboard,
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              CustomText(
                                label: "Already have an account? ",
                                labelcolor: Colors.black,
                                fontsize: 21,
                              ),
                              CustomText(
                                label: "Login",
                                labelcolor: Color.fromARGB(255, 6, 124, 221),
                                onTap: navigateToLogin,
                                fontsize: 21,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToLogin() {
    Get.toNamed("/");
  }

  void navigateToDashboard() {
    Get.offNamed("/home");
  }
}
