import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
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
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: feedingGetIt.feedList.length,
          itemBuilder: (context, index) {
            final list = feedingGetIt.feedList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  feedingGetIt.delete(list.id);
                },
                child: GestureDetector(
                  onTap: () {
                    Navigation.push(
                      page: FeedingView(),
                    );
                  
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
                                  "Feeding",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Text(
                              list.time,
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
      ),
    );
  }
}
