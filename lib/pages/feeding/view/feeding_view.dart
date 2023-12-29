import 'package:baby_tracker/companent/custom_button/custom_elevated_button.dart';
import 'package:baby_tracker/companent/custom_textFormField/custom_textFormField.dart';
import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/feeding/viewmodel/feeding_viewmodel.dart';
import 'package:baby_tracker/pages/home/view/home_view.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';
import 'package:baby_tracker/pages/onbording/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FeedingView extends StatefulWidget {
  const FeedingView({Key? key}) : super(key: key);

  @override
  State<FeedingView> createState() => _FeedingViewState();
}

class _FeedingViewState extends State<FeedingView> {
  final feedingGetIt = locator<FeedingViewModel>();
  final informationGetIt = locator<InformationViewModel>();

  @override
  void initState() {
     feedingGetIt.timeController.addListener(feedingGetIt.updateButtonStatus);
    feedingGetIt.mlController.addListener(feedingGetIt.updateButtonStatus);
    feedingGetIt.noteController.addListener(feedingGetIt.updateButtonStatus);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: TextWidgets(text: "Feeding", size: 27, color: darkBlue),
      ),
      body: Observer(
        builder: (context) => Column(
          children: [
            SizedBox(height: 30),
            CustomTextFormField(
              labelText: "Time",
              controller: feedingGetIt.timeController,
              keyboardType: TextInputType.name,
              onTap: () {
                informationGetIt.selectTime(
                  context,
                  feedingGetIt.timeController,
                );
              },
            ),
            SizedBox(height: 30),
            CustomTextFormField(
              labelText: "Amount(ml)",
              controller: feedingGetIt.mlController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30),
            CustomTextFormField(
              hintText: "Note",
              controller: feedingGetIt.noteController,
              keyboardType: TextInputType.name,
              maxLines: 10,
            ),
            Spacer(),
            CustomElevatedButtonView(
                text: "Kaydet",
                onTop: () async {
                  if (feedingGetIt.isButtonEnabled) {
                    if (feedingGetIt.selectedFeed == null) {
                      await feedingGetIt.addFeeding();
                    } else {
                      await feedingGetIt.upDate(feedingGetIt.selectedFeed!.id);
                    }

                    // Diğer işlemler
                    Navigation.push(
                      page: HomeView(),
                    );
                  } else {
                 
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Doğrulama Hatası"),
                          content: Text(
                              " Devam etmek için  lütfen tüm alanları  doldurun!!!"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Tamam"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                color: darkPurple),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
