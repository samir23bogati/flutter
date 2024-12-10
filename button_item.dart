import 'package:flutter/material.dart';
class ButtonItem {
  final String? label;
  final IconData? icon;
  final Color textColor;
  final VoidCallback onTap;

  ButtonItem({
     this.label,
     this.icon,
    required  this.textColor,
    required this.onTap,
  });
}