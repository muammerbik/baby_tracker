import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/calender/viewmodel/calender_viewmodel.dart';
import 'package:baby_tracker/pages/diaper_change/viewmodel/diaper_viewmodel.dart';
import 'package:baby_tracker/pages/feeding/view/feeding_view.dart';
import 'package:baby_tracker/pages/feeding/viewmodel/feeding_viewmodel.dart';
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
    return Observer(
      builder: (context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: calenderGetIt.mergedList.length,
            itemBuilder: (context, index) {
              final item = calenderGetIt.mergedList[index];
              


              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Dismissible(
                  direction: DismissDirection.startToEnd,
                  background: Row(children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Delete",
                      style: TextStyle(fontSize: 20),
                    )
                  ]),
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    calenderGetIt.mergedList.removeAt(index); 

                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigation.push(
                        page: FeedingView(),
                      );
                    },
                    child: Container(
                      width: 380,
                      height: 105,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF3F3F3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/icons/file.png",
                                  color: Colors.orange.shade800,
                                  height: 40,
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
                                  Image.asset(item.iconPath,
                                      height: 38, color: darkBlue),
                                  SizedBox(width: 5),
                                  Text(
                                    item.category,
                                    style: TextStyle(
                                        fontSize: 18, color: darkBlue),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  item.time,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
