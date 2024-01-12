import 'package:baby_tracker/companent/navigation_helper/navigation_helper.dart';
import 'package:baby_tracker/constants/app_strings.dart';
import 'package:baby_tracker/core/hive.dart';
import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/main_view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';

//dart run build_runner build
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  allAdapter();
  await allBox();
  setupGetIt();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: cTransparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
          appBarTheme: const AppBarTheme(backgroundColor: white),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: purple)
              .copyWith(background: white)
              .copyWith(background: white),
        ),
        home: const MainView());
  }
}
