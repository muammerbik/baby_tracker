import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/inapp/view/inapp_view.dart';
import 'package:baby_tracker/pages/onbording/view/onbording_view.dart';
import 'package:baby_tracker/pages/settings/view/settings_view.dart';
import 'package:baby_tracker/pages/sleep/view/sleep_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: cTransparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: mTitle,
        debugShowCheckedModeBanner: false,
        navigatorKey: Navigation.navigationKey,
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
              .copyWith(background: white)
              .copyWith(background: Colors.white),
        ),
        home: OnbordingView());
  }
}
