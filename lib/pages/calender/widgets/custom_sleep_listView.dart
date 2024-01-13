
import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/sleep/view/sleep_view.dart';
import 'package:baby_tracker/pages/sleep/viewmodel/sleep_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomSleepListView extends StatefulWidget {
  const CustomSleepListView({super.key});

  @override
  State<CustomSleepListView> createState() => _CustomSleepListViewState();
}

class _CustomSleepListViewState extends State<CustomSleepListView> {
  final sleepGetIt = locator<SleepViewModel>();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return sleepGetIt.sleepList.isNotEmpty
        ? ListView.builder(
            itemCount: sleepGetIt.sleepList.length,
            itemBuilder: (context, index) {
              final list = sleepGetIt.sleepList[index];
              return Dismissible(
                direction: DismissDirection.startToEnd,
                background: const Row(children: [
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
                  sleepGetIt.delete(list.id);
                },
                child: GestureDetector(
                  onTap: () {
                    Navigation.push(
                      page: SleepView(sleepModel: list),
                    );
                    sleepGetIt.selectedSlep = list;
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
                            padding: EdgeInsets.symmetric(
                                horizontal: DeviceConfig.screenWidth! * 0.0373,
                                vertical: DeviceConfig.screenHeight! * 0.0107),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      sleepIcon,
                                      height:
                                          DeviceConfig.screenHeight! * 0.0480,
                                      color: darkBlue,
                                    ),
                                    const SizedBox(width: 5),
                                    const TextWidgets(
                                      text: sleep,
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
                                    text: list.wakeUp,
                                    size: 16,
                                    color: black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            title: Row(
                              children: [
                                Image.asset(
                                  calenderImg,
                                  color: orange.shade800,
                                  height: DeviceConfig.screenHeight! * 0.0451,
                                ),
                                const Text(
                                  "Sleep Note",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    sleepGetIt.updateSelectedIndex(index);
                                  });
                                },
                                icon: Icon(
                                  sleepGetIt.sleepSelectIndex == index
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                )),
                          ),
                          if (sleepGetIt.sleepSelectIndex == index)
                            Observer(
                              builder: (context) => Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        DeviceConfig.screenWidth! * 0.0373,
                                    vertical:
                                        DeviceConfig.screenHeight! * 0.0107),
                                child: Text(
                                  list.note,
                                  style: const TextStyle(fontSize: 16),
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
        : const Center(
            child: TextWidgets(
              text: sleepIsnotempty,
              size: 18,
              color: black,
            ),
          );
  }
}
