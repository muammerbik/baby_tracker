import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
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
  void initState() {
    diaperGetIt.initDiaper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: diaperGetIt.diaperList.isNotEmpty
            ? ListView.builder(
                itemCount: diaperGetIt.diaperList.length,
                itemBuilder: (context, index) {
                  final list = diaperGetIt.diaperList[index];
                  print(list.id);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Dismissible(
                      direction: DismissDirection.startToEnd,
                      background: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 30,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Delete",
                            style: TextStyle(fontSize: 20),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons/file.png",
                                      color: Colors.orange.shade800,
                                      height: 45,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/diaper1.png",
                                          height: 22,
                                          color: darkBlue,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "Diaper Change",
                                          style: TextStyle(
                                              fontSize: 18, color: darkBlue),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: DiaperStatusDisplay(
                                      // Burada String değerden DiaperStatus'a dönüştürüyoruz
                                      status: getDiaperStatusFromString(
                                          list.diaperStatus),
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
              )
            : Center(
                child: Text(
                  "No information about changing diapers!",
                  style: TextStyle(fontSize: 18),
                ),
              ),
      ),
    );
  }

  DiaperStatus getDiaperStatusFromString(String statusString) {
    // Bu fonksiyon, String değeri DiaperStatus enum değerine çevirir
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
