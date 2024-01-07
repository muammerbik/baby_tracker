// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';

class CustomTextFormField extends StatefulWidget {
  final String? labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final String? hintText;
  final int? maxLines;
  const CustomTextFormField({
    Key? key,
    this.labelText,
    required this.controller,
    this.validator,
    this.onTap,
    this.keyboardType,
    this.hintText,
    this.maxLines,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Observer(
      builder: (context) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: DeviceConfig.screenWidth! * 0.0467),
        child: TextFormField(
          textInputAction: TextInputAction.done,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          onTap: widget.onTap,
          maxLines: widget.maxLines ?? null,
          decoration: InputDecoration(
            filled: true,
            fillColor: textWhite,
            labelText: widget.labelText,
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: purple, width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
