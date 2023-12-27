import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/get_it/get_it.dart';
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
    return Observer(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: diaperGetIt.diaperList.length,
          itemBuilder: (context, index) {
            final list = diaperGetIt.diaperList[index];
            print(list.id);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Dismissible(
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
                                  "Diaper Change",
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
