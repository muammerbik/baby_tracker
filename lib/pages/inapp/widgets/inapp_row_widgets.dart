// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:flutter/material.dart';
import 'package:baby_tracker/pages/onbording/widgets/text_widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InappRowWidgets extends StatelessWidget {
  final List<String> texts;
  final double size;

  const InappRowWidgets({
    Key? key,
    required this.texts,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Observer(
      builder: (context) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: DeviceConfig.screenWidth! * 0.23),
        child: Column(
          children: List.generate(
            texts.length,
            (index) => buildRowWidget(
              texts[index],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRowWidget(String text) {
    return Row(
      children: [
        Image.asset(
          "assets/images/inapp2.png",
          width: DeviceConfig.screenWidth! * 0.0351,
          height: 15,
        ),
        SizedBox(
          width: DeviceConfig.screenWidth! * 0.0167,
        ),
        TextWidgets(
          text: text,
          size: size,
          color: black,
        ),
      ],
    );
  }
}
