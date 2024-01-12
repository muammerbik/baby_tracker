import 'package:baby_tracker/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';

class ActionSheet extends StatelessWidget {
  final VoidCallback cameraTapped;
  final VoidCallback galleryTapped;

  const ActionSheet({
    required this.cameraTapped,
    required this.galleryTapped,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text(camera),
          onPressed: () {
            cameraTapped();
            Navigator.of(context).pop();
          },
        ),
        CupertinoActionSheetAction(
          child: const Text(gallery),
          onPressed: () {
            galleryTapped();
            Navigator.pop(context);
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(cancel),
      ),
    );
  }
}
