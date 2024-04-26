import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/customButton.dart';
import 'package:flutter_application_1/views/customtext.dart';
import 'package:flutter_application_1/views/customtextField.dart';

import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordVisible = false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 33, 86, 1),
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
              padding:
                  EdgeInsets.only(top: screenHeight * 0.2, left: 15, right: 15),
              width: screenWidth,
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
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: CustomText(
                            label: 'Welcome',
                            fontsize: 25,
                            fontWeight: FontWeight.bold,
                            labelcolor: Colors.black,
                          ),
                        ),
                        CustomTextField(
                          controller: usernameController,
                          hintText: "Enter Email/Username",
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
                        const SizedBox(height: 20),
                        CustomButton(
                          onPressed: () {},
                          label: ("Login"),
                          buttonColor: Color.fromARGB(255, 154, 43, 43),
                          width: 25,
                          action: navigateToDashboard,
                        ),
                        SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Row(
                            children: [
                              CustomText(
                                  label: "Don't have an account? ",
                                  labelcolor: Colors.black),
                              GestureDetector(
                                onTap:
                                    navigateToSignup, // Use the navigateToSignup method directly
                                child: CustomText(
                                  label: "Signup",
                                  labelcolor: Color.fromARGB(255, 95, 187, 226),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
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

  void navigateToSignup() {
    Get.toNamed("/signup");
  }

  void navigateToDashboard() {
    Get.offNamed("/home");
  }
}
