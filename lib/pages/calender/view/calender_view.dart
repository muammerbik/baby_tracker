import 'package:baby_tracker/pages/calender/widgets/tabbar_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) => const Column(
          children: [
            Expanded(
              child: TabbarView(),
            ),
          ],
        ),
      ),
    );
  }
}
