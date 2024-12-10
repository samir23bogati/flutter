import 'package:calculator/components/calculator/color.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final double height;
  final double width;
  final Color textColor;
  final IconData? icon;
  final Color backgroundColor;

  CalculatorButton({
    super.key,
   this.label,
    this.onPressed,
    this.textColor = AppColor.textColor,
    this.height =96,
    this.width =96,
    this.icon,
    this.backgroundColor= AppColor.background,
  }):assert(
    (label != null && icon== null)||(icon != null && label== null),
    "You cannot provide label and icon at the same time.");


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
      height:height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:backgroundColor,
      ),
      alignment: Alignment.center,
        child: label != null 
        ? Text(
         label!,
         style: TextStyle(
          color: textColor,
          fontSize:32,
          fontWeight: FontWeight.w500,
         ),
        )
        :Icon(
          icon,
          size: 32,
           color: textColor,
        )
      ),
    );
  }
}