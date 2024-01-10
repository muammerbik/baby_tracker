import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/core/hive.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/feeding/view/feeding_view.dart';
import 'package:baby_tracker/pages/feeding/viewmodel/feeding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomFeedListView extends StatefulWidget {
  const CustomFeedListView({super.key});

  @override
  State<CustomFeedListView> createState() => _CustomFeedListViewState();
}

class _CustomFeedListViewState extends State<CustomFeedListView> {
  final feedingGetIt = locator<FeedingViewModel>();

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Observer(
      builder: (context) => feedingGetIt.feedList.isNotEmpty
          ? ListView.builder(
              itemCount: feedingGetIt.feedList.length,
              itemBuilder: (context, index) {
                final list = feedingGetIt.feedList[index];
                return Dismissible(
                  direction: DismissDirection.startToEnd,
                  background: Row(children: [
                    Icon(
                      Icons.delete,
                      color: red,
                      size: 30,
                    ),
                    TextWidgets(
                      text: delete,
                      size: 20,
                      color: black,
                    )
                  ]),
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    feedingGetIt.delete(list.id);
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigation.push(
                        page: FeedingView(/**feedingModel: list */),
                      );
                      feedingGetIt.selectedFeed = list;
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: DeviceConfig.screenHeight! * 0.0109,
                        horizontal: DeviceConfig.screenHeight! * 0.0200,
                      ),
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
                                  horizontal: 11, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        feedingIcon,
                                        height:
                                            DeviceConfig.screenHeight! * 0.0450,
                                        color: darkBlue,
                                      ),
                                      TextWidgets(
                                        text: feeding,
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
                                    "Feeding Note",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      feedingGetIt.updateSelectedIndex(index);
                                    });
                                  },
                                  icon: Icon(
                                    selectedIndex == index
                                        ? Icons.expand_less
                                        : Icons.expand_more,
                                  )),
                            ),
                            if (feedingGetIt.selectedIndex == index)
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
              child: TextWidgets(
                text: feedingIsempty,
                size: 18,
                color: black,
              ),
            ),
    );
  }
}
