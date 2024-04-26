import 'package:flutter/material.dart';
import 'package:flutter_application_1/configurations/constants.dart';
import 'package:flutter_application_1/views/customtext.dart';


class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final VoidCallback? action;
  final Color buttonColor;
  final double width;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.buttonColor = appGrayColor,
    this.width = 18,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      child: CustomText(
        label: label,
        labelcolor: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: Size(width, 50),
      ),
    );
  }
}
