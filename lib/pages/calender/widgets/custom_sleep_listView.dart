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
                sleepGetIt.delete(list.id);
              },
              child: GestureDetector(
                onTap: () {
                  Navigation.push(
                    page: SleepView(),
                  );
                  sleepGetIt.selectedSlep = list;
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Image.asset("assets/images/sleep.png",
                                    height: 35, color: darkBlue),
                                SizedBox(width: 5),
                                Text(
                                  "Sleep",
                                  style:
                                      TextStyle(fontSize: 18, color: darkBlue),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              list.wakeUp,
                              style: TextStyle(fontSize: 16),
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
    );
  }
}
