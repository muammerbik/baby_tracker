import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';
import 'package:baby_tracker/pages/information/widgets/action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AddImageWidgets extends StatefulWidget {
  const AddImageWidgets({Key? key}) : super(key: key);

  @override
  State<AddImageWidgets> createState() => _AddImageWidgetsState();
}

class _AddImageWidgetsState extends State<AddImageWidgets> {
  final informationGetIt = locator<InformationViewModel>();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Observer(
      builder: (context) => GestureDetector(
        onTap: () {
          showCustomActionSheet(
            context,
            () {
              // Camera Tapped
              informationGetIt.imgFromCamera();
            },
            () {
              // Gallery Tapped
              informationGetIt.imgFromGallery();
              ;
            },
          );
        },
        child: Stack(
          children: [
            Container(
              width: DeviceConfig.screenWidth! * 0.3130,
              height: DeviceConfig.screenHeight! * 0.1459,
              decoration: ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(width: 1, color: purple),
                ),
              ),
              child: informationGetIt.imageFile == null
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: DeviceConfig.screenWidth! * 0.0817),
                      child: Image.asset("assets/images/camera.png"),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(150.0),
                      child: Image.file(
                        informationGetIt.imageFile!,
                        fit: BoxFit.fill,
                      ),
                    ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: informationGetIt.imageFile == null
                  ? Container(
                      height: DeviceConfig.screenHeight! * 0.0323,
                      width: DeviceConfig.screenWidth! * 0.0700,
                      decoration: ShapeDecoration(
                        color: white,
                        shape: OvalBorder(
                          side: BorderSide(width: 1, color: purple),
                        ),
                      ),
                      child: Image.asset(
                        "assets/images/add.png",
                      ),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }

  void showCustomActionSheet(
    BuildContext context,
    VoidCallback cameraTapped,
    VoidCallback galleryTapped,
  ) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return ActionSheet(
          cameraTapped: cameraTapped,
          galleryTapped: galleryTapped,
        );
      },
    );
  }
}
