import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/diaper_change/viewmodel/diaper_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DiaperChangeColumn extends StatefulWidget {
  const DiaperChangeColumn({Key? key}) : super(key: key);

  @override
  State<DiaperChangeColumn> createState() => _DiaperChangeColumnState();
}

class _DiaperChangeColumnState extends State<DiaperChangeColumn> {
  final diaperViewmodel = locator<DiaperViewModel>();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Observer(
      builder: (context) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: DeviceConfig.screenWidth! * 0.0511,
            vertical: DeviceConfig.screenHeight! * 0.0107),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidgets(
              text: diaperStatus,
              size: 15,
              color: black,
            ),

            SizedBox(height: DeviceConfig.screenHeight! * 0.0107),
            diaperStatusRow(DiaperStatus.Wet, "wett.png", "Wet"),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0107),

            diaperStatusRow(DiaperStatus.Dirty, "dirtyy.png", "Dirty"),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0107),

            diaperStatusRow(DiaperStatus.Mixed, "mixedd.png", "Mixed"),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0107),

            diaperStatusRow(DiaperStatus.Dry, "dryy.png", "Dry"),
            SizedBox(height: DeviceConfig.screenHeight! * 0.0207),

            // Eklenen kısım
          ],
        ),
      ),
    );
  }

  Widget diaperStatusRow(DiaperStatus status, String imagePath, String text) {
    bool isSelected = diaperViewmodel.selectedStatus == status;

    return Observer(
      builder: (context) => InkWell(
        onTap: () async {
          diaperViewmodel.selectedStatus = isSelected ? null : status;
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: DeviceConfig.screenWidth! * 0.0700,
              height: DeviceConfig.screenHeight! * 0.0363,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                  isSelected
                      ? "assets/images/$imagePath"
                      : "assets/images/$imagePath",
                  height: DeviceConfig.screenHeight! * 0.0363,
                  color: isSelected ? null : diaperColor),
            ),
            SizedBox(width: DeviceConfig.screenWidth! * 0.0233),
            TextWidgets(
              text: text,
              size: 14,
              color: isSelected ? darkBlue : lightGrey,
            )
          ],
        ),
      ),
    );
  }

  String getDiaperText(DiaperStatus status) {
    switch (status) {
      case DiaperStatus.Wet:
        return "Wet";
      case DiaperStatus.Dirty:
        return "Dirty";
      case DiaperStatus.Mixed:
        return "Mixed";
      case DiaperStatus.Dry:
        return "Dry";
    }
  }
}
