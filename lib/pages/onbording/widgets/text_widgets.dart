// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextWidgets extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final String? family;
  final FontWeight? fontWeight;
  final TextAlign? textAlign; // Eklenen özellik

  const TextWidgets({
    required this.text,
    this.color,
    required this.size,
    this.family,
    this.fontWeight,
    this.textAlign, // Eklenen özellik
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center, 
      style: TextStyle(
        color: color ?? Color(0xFFF8F8F8),
        fontSize: size,
        fontFamily: family ?? 'Poppins',
        fontWeight: fontWeight ?? FontWeight.w600,
      ),
    );
  }
}