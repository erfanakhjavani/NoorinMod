
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Core/Bindings/bindings.dart';
import 'Core/Constants/app_route.dart';
import 'Core/Themes/themes.dart';

//! Main function to initialize the app and set up system configurations
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //* Ensure Flutter is fully initialized before running

  runApp(const Main()); //* Run the main app widget
}

//! Main class for the app, extends StatelessWidget
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //* Disable debug banner
      theme: Themes.light,
      //* Define light theme
      initialRoute: AppRoute.introSplashView, //* Set the initial route (splash screen)
      locale: const Locale('fa'),
      getPages: AppRoute.pages,
      initialBinding: MyBindings(),

    );
  }
}
