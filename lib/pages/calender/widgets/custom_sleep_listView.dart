import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/sleep/view/sleep_view.dart';
import 'package:baby_tracker/pages/sleep/viewmodel/sleep_viewmodel.dart';
import 'package:flutter/material.dart';

class CustomSleepListView extends StatefulWidget {
  const CustomSleepListView({super.key});

  @override
  State<CustomSleepListView> createState() => _CustomSleepListViewState();
}

class _CustomSleepListViewState extends State<CustomSleepListView> {
  final sleepGetIt = locator<SleepViewModel>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: sleepGetIt.sleepList.length,
        itemBuilder: (context, index) {
          final list = sleepGetIt.sleepList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                sleepGetIt.delete(list.id);
              },
              child: GestureDetector(
                onTap: () {
                     Navigation.push(
                    page: SleepView(),
                  );
                  sleepGetIt.upDate(list.id);
                },
                child: Container(
                  width: 380,
                  height: 119,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF3F3F3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/file.png",
                            height: 50,
                          ),
                          Text(
                            "12 Feb2021",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/bottle.png",
                                  height: 40, color: darkBlue),
                              Text(
                                list.fellSleep,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Text(
                            list.note,
                            style: TextStyle(fontSize: 20),
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
    );
  }
}
