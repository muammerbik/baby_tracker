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
                        page: DiaperChangeView(diaperChangeModel: list,),
                      );
                      diaperGetIt.selectedDiaper = list;
                
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: DeviceConfig.screenHeight! * 0.0109,
                          horizontal: DeviceConfig.screenHeight! * 0.0200),
                      child: Container(
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          color: darkWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        diaperIcon,
                                        height:
                                            DeviceConfig.screenHeight! * 0.0300,
                                        color: darkBlue,
                                      ),
                                      SizedBox(width: 10),
                                      TextWidgets(
                                        text: diaper,
                                        size: 18,
                                        color: darkBlue,
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          DeviceConfig.screenWidth! * 0.044,
                                    ),
                                    child: TextWidgets(
                                      text: list.time,
                                      size: 16,
                                      color: black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            ListTile(
                              title: Row(
                                children: [
                                  Image.asset(
                                    calenderImg,
                                    color: orange.shade800,
                                    height: DeviceConfig.screenHeight! * 0.0451,
                                  ),
                                  Text(
                                    "Diaper Note",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      diaperGetIt.updateSelectedIndex(index);
                                    });
                                  },
                                  icon: Icon(
                                    diaperGetIt.diaperSelectedIndex == index
                                        ? Icons.expand_less
                                        : Icons.expand_more,
                                  )),
                            ),
                            if (diaperGetIt.diaperSelectedIndex == index)
                              Observer(
                                builder: (context) => Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    list.note,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
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
