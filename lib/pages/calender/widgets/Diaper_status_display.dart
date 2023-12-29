import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/pages/diaper_change/viewmodel/diaper_viewmodel.dart';
import 'package:flutter/material.dart';

class DiaperStatusDisplay extends StatelessWidget {
  final DiaperStatus status;

  DiaperStatusDisplay({required this.status});

  @override
  Widget build(BuildContext context) {
    String text;
    String imagePath;
    Color textColor;

    switch (status) {
      case DiaperStatus.Wet:
        text = "Wet";
        imagePath = "wett.png";
        textColor = darkBlue;
        break;
      case DiaperStatus.Dirty:
        text = "Dirty";
        imagePath = "dirtyy.png";
        textColor = darkBlue;
        break;
      case DiaperStatus.Mixed:
        text = "Mixed";
        imagePath = "mixedd.png";
        textColor = darkBlue;
        break;
      case DiaperStatus.Dry:
        text = "Dry";
        imagePath = "dryy.png";
        textColor = darkBlue;
        break;
      default:
        text = "";
        imagePath = "";
        textColor = Colors.black;
        break;
    }

    return Row(
      children: [
        Image.asset(
          "assets/images/$imagePath",
          height: 22,
          color: textColor,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(fontSize: 16, color: textColor),
        ),
      ],
    );
  }
}
