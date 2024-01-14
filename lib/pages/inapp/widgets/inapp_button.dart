import 'package:baby_tracker/companent/custom_text/text_widgets.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/inapp/viewmodel/inapp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InappButton extends StatefulWidget {
  const InappButton({Key? key}) : super(key: key);

  @override
  State<InappButton> createState() => _InappButtonState();
}
class _InappButtonState extends State<InappButton> {
  final inappViewmodel = locator<InappViewModel>();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Observer(
      builder: (context) => Column(
        children: List.generate(
          3,
          (index) => buildButton(
            index,
            buttonText: getButtonText(index),
            buttonPrice: getButtonPrice(index),
          ),
        ),
      ),
    );
  }

  Widget buildButton(int index,
      {required String buttonText, required String buttonPrice}) {
    bool isSelected = inappViewmodel.selectedButtonIndex == index;

    return Observer(
      builder: (context) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: DeviceConfig.screenWidth! * 0.0467,
          vertical: DeviceConfig.screenHeight! * 0.0107,
        ),
        child: GestureDetector(
          onTap: () {
            if (inappViewmodel.selectedButtonIndex == index) {
              inappViewmodel.selectedButtonIndex = -1;
            } else {
              inappViewmodel.selectedButtonIndex = index;
            }
          },
          child: Container(
            width: double.infinity,
            height: DeviceConfig.screenHeight! * 0.0885,
            decoration: ShapeDecoration(
              color: darkWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(
                  color: isSelected ? btnBlue : cTransparent,
                  width: 2.0,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DeviceConfig.screenWidth! * 0.0467,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidgets(
                    text: buttonText,
                    size: 18,
                    color: black,
                  ),
                  TextWidgets(
                    text: buttonPrice,
                    size: 18,
                    color: black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getButtonText(int index) {
    if (index == 0) {
      return 'Weekly';
    } else if (index == 1) {
      return 'Monthly';
    } else {
      return 'Annual';
    }
  }

  String getButtonPrice(int index) {
    if (index == 0) {
      return '\$10';
    } else if (index == 1) {
      return '\$15';
    } else {
      return '\$20';
    }
  }
}
