import 'package:flutter/cupertino.dart';

class ActionSheet extends StatelessWidget {
  final VoidCallback cameraTapped;
  final VoidCallback galleryTapped;

  ActionSheet({
    required this.cameraTapped,
    required this.galleryTapped,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("Camera"),
          onPressed: () {
            cameraTapped();
            Navigator.of(context).pop();
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Gallery"),
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
        child: Text("Cancel"),
      ),
    );
  }
}
