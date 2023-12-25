import 'package:baby_tracker/constants/app_strings.dart';
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
  final diaperGetIt = locator<DiaperViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Diaper Status',
              style: TextStyle(
                color: Color(0xFF010101),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            diaperStatusRow(DiaperStatus.Wet, "wett.png", "Wet"),
            SizedBox(height: 10),
            diaperStatusRow(DiaperStatus.Dirty, "dirtyy.png", "Dirty"),
            SizedBox(height: 10),
            diaperStatusRow(DiaperStatus.Mixed, "mixedd.png", "Mixed"),
            SizedBox(height: 10),
            diaperStatusRow(DiaperStatus.Dry, "dryy.png", "Dry"),
          ],
        ),
      ),
    );
  }

  Widget diaperStatusRow(DiaperStatus status, String imagePath, String text) {
    bool isSelected = diaperGetIt.selectedStatus == status;

    return Observer(
      builder: (context) => InkWell(
        onTap: () async {
          diaperGetIt.selectedStatus = isSelected ? null : status;

        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30, // Resim genişliği
              height: 30, // Resim yüksekliği
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  isSelected
                      ? "assets/images/$imagePath"
                      : "assets/images/$imagePath",
                  height: 30, // Aynı yükseklikte tut
                  color: isSelected ? null : Color(0xFFC2C2C2),
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? darkBlue : Color(0xFFC2C2C2),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
