import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/calender/viewmodel/calender_viewmodel.dart';
import 'package:baby_tracker/pages/diaper_change/view/diaper_change_view.dart';
import 'package:baby_tracker/pages/diaper_change/viewmodel/diaper_viewmodel.dart';
import 'package:baby_tracker/pages/feeding/view/feeding_view.dart';
import 'package:baby_tracker/pages/feeding/viewmodel/feeding_viewmodel.dart';
import 'package:baby_tracker/pages/sleep/view/sleep_view.dart';
import 'package:baby_tracker/pages/sleep/viewmodel/sleep_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomAllListView extends StatefulWidget {
  const CustomAllListView({super.key});

  @override
  State<CustomAllListView> createState() => _CustomAllListViewState();
}

class _CustomAllListViewState extends State<CustomAllListView> {
  final calenderGetIt = locator<CalenderViewMoel>();
  final feedingGetIt = locator<FeedingViewModel>();
  final sleepGetIt = locator<SleepViewModel>();
  final diaperGetIt = locator.get<DiaperViewModel>();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Observer(
      builder: (context) => Center(
        child: calenderGetIt.mergedList.isNotEmpty
            ? ListView.builder(
                itemCount: calenderGetIt.mergedList.length,
                itemBuilder: (context, index) {
                  final item = calenderGetIt.mergedList[index];
                  return Dismissible(
                    direction: DismissDirection.startToEnd,
                    background: Row(children: [
                      Icon(
                        Icons.delete,
                        color: red,
                        size: 30,
                      ),
                      TextWidgets(
                        text: "Delete",
                        size: 20,
                        color: black,
                      )
                    ]),
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      if (item.type == "feeding") {
                        feedingGetIt.delete(item.id);
                      } else if (item.type == "diaper") {
                        diaperGetIt.delete(item.id);
                      } else {
                        sleepGetIt.delete(item.id);
                      }
                    },
                    child: GestureDetector(
                      onTap: () {
                        if (item.type == "feeding") {
                          Navigation.push(
                            page: FeedingView(
                                feedingModel: feedingGetIt.selectedFeed),
                          );

                          feedingGetIt.selectedFeed =
                              feedingGetIt.feedList[index];
                        } else if (item.type == "diaper") {
                          Navigation.push(
                            page: DiaperChangeView(
                              diaperChangeModel: diaperGetIt.selectedDiaper,
                            ),
                          );

                          diaperGetIt.selectedDiaper =
                              diaperGetIt.diaperList[index];
                        } else {
                          Navigation.push(
                            page: SleepView(
                              sleepModel: sleepGetIt.selectedSlep,
                            ),
                          );

                          sleepGetIt.selectedSlep = sleepGetIt.sleepList[index];
                        }
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
                                    horizontal: 16, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          item.iconPath,
                                          height: DeviceConfig.screenHeight! *
                                              0.0480,
                                          color: darkBlue,
                                        ),
                                        SizedBox(width: 5),
                                        TextWidgets(
                                          text: item.category,
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
                                        text: item.date,
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
                                      height:
                                          DeviceConfig.screenHeight! * 0.0451,
                                    ),
                                    Text(
                                      calenderGetIt.capitalizeWithSuffix(
                                          item.type, " Note"),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      calenderGetIt.updateSelectedIndex(index);
                                    });
                                  },
                                  icon: Icon(
                                    calenderGetIt.allSelectedIndex == index
                                        ? Icons.expand_less
                                        : Icons.expand_more,
                                  ),
                                ),
                              ),
                              if (calenderGetIt.allSelectedIndex == index)
                                Observer(
                                  builder: (context) => Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      item.note,
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
                child: TextWidgets(
                  text: diaperIsempty,
                  size: 18,
                  color: black,
                ),
              ),
      ),
    );
  }
}
