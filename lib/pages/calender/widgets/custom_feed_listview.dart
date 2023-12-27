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
  void initState() {
    feedingGetIt.initGet();
    super.initState();
  }

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
                  feedingGetIt.delete(list.id);
                },
                child: GestureDetector(
                  onTap: () {
                    Navigation.push(
                      page: FeedingView(),
                    );
                    feedingGetIt.selectedFeed = list;
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
                                Image.asset("assets/images/bottle.png",
                                    height: 37, color: darkBlue),
                                Text(
                                  "Feeding",
                                  style:
                                      TextStyle(fontSize: 18, color: darkBlue),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                list.time,
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
    );
  }
}
