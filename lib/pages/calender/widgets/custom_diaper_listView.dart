import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/calender/widgets/Diaper_status_display.dart';
import 'package:baby_tracker/pages/diaper_change/view/diaper_change_view.dart';
import 'package:baby_tracker/pages/diaper_change/viewmodel/diaper_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomDiaperListView extends StatefulWidget {
  const CustomDiaperListView({super.key});

  @override
  State<CustomDiaperListView> createState() => _CustomDiaperListViewState();
}

class _CustomDiaperListViewState extends State<CustomDiaperListView> {
  final diaperGetIt = locator.get<DiaperViewModel>();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Observer(
      builder: (context) => diaperGetIt.diaperList.isNotEmpty
          ? ListView.builder(
              itemCount: diaperGetIt.diaperList.length,
              itemBuilder: (context, index) {
                final list = diaperGetIt.diaperList[index];

                return Dismissible(
                  direction: DismissDirection.startToEnd,
                  background: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: red,
                        size: 30,
                      ),
                      SizedBox(width: 5),
                      TextWidgets(
                        text: delete,
                        size: 20,
                        color: black,
                      ),
                    ],
                  ),
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    diaperGetIt.delete(list.id);
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigation.push(
                        page: DiaperChangeView(),
                      );
                      diaperGetIt.selectedDiaper = list;
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: DeviceConfig.screenHeight! * 0.0109,
                          horizontal: DeviceConfig.screenHeight! * 0.0200),
                      child: Container(
                        width: double.infinity,
                        height: DeviceConfig.screenHeight! * 0.14,
                        decoration: ShapeDecoration(
                          color: darkWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: DeviceConfig.screenHeight! * 0.0059,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    calenderImg,
                                    color: orange.shade800,
                                    height: DeviceConfig.screenHeight! * 0.0491,
                                  ),
                                  Text(
                                    "12 Feb2021",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              DeviceConfig.screenWidth! *
                                                  0.0302),
                                      child: DiaperStatusDisplay(
                                        status: getDiaperStatusFromString(
                                            list.diaperStatus),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          DeviceConfig.screenWidth! * 0.024),
                                  child: Text(
                                    list.time,
                                    style: TextStyle(
                                        fontSize: 18, color: darkBlue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                diaperIsempty,
                style: TextStyle(fontSize: 18),
              ),
            ),
    );
  }

  DiaperStatus getDiaperStatusFromString(String statusString) {
    switch (statusString) {
      case '0':
        return DiaperStatus.Wet;
      case '1':
        return DiaperStatus.Dirty;
      case '2':
        return DiaperStatus.Mixed;
      case '3':
        return DiaperStatus.Dry;
      default:
        return DiaperStatus.Wet;
    }
  }
}
