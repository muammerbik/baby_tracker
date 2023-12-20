import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/constants/device_config.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';
import 'package:flutter/material.dart';
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
          showImagePicker();
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
                      child: Image.asset(
                  "assets/images/camera.png"
                      ),
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
              child: Container(
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
              ),
            )
          ],
        ),
      ),
    );
  }

  void showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        DeviceConfig().init(context);
        return Observer(
          builder: (context) => Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5.2,
              margin: const EdgeInsets.only(top: 8.0),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 60.0,
                          ),
                          SizedBox(height: DeviceConfig.screenHeight! * 0.0170),
                          Text(
                            gallery,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: black),
                          ),
                        ],
                      ),
                      onTap: () {
                        informationGetIt.imgFromGallery();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: SizedBox(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.camera_alt,
                              size: 60.0,
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              camera,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: black),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        informationGetIt.imgFromCamera();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
