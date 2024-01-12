// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/companent/custom_text/text_widgets.dart';

class CustomElevatedButtonView extends StatefulWidget {
  final String text;
  final Function() onTop;
  final Color color;
  const CustomElevatedButtonView({
    Key? key,
    required this.text,
    required this.onTop,
    required this.color,
  }) : super(key: key);

  @override
  State<CustomElevatedButtonView> createState() =>
      _CustomElevatedButtonViewState();
}

class _CustomElevatedButtonViewState extends State<CustomElevatedButtonView> {
  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);

    return Observer(
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DeviceConfig.screenWidth! * 0.0584),
          child: GestureDetector(
            onTap: widget.onTop,
            child: Container(
              width: double.infinity,
              height: DeviceConfig.screenHeight! * 0.0851,
              decoration: ShapeDecoration(
                color: widget.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                shadows: const [
                  BoxShadow(
                    color: lightGrey,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                    spreadRadius: 4,
                  )
                ],
              ),
              child: Align(
                alignment: Alignment.center,
                child: TextWidgets(text: widget.text, size: 20),
              ),
            ),
          ),
        );
      },
    );
  }
}
