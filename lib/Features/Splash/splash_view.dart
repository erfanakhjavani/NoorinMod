import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Core/Constants/app_colors.dart';
import '../../Core/Gen/assets.gen.dart';
import 'splash_model.dart';
import 'splash_viewmodel.dart';

//! SplashView class to display the splash screen and handle connection status
class SplashView extends GetView<SplashViewmodel> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var width =
        MediaQuery.sizeOf(context).width; //* Get the width of the screen
    var height =
        MediaQuery.sizeOf(context).width; //* Get the height of the screen

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: height * .50,
                right: width * .15,
                left: width * .15,
                child: Image.asset(
                  'assets/png/logo.png', //* Display the logo image
                )),
            Positioned(
                top: height * 1.03,
                right: width * .15,
                left: width * .15,

                child: DelayedWidget(
                  delayDuration: const Duration(milliseconds: 1500),
                  child: Assets.png.title.image(
                    fit:
                        BoxFit.fitWidth, //* Fit the image to the screen width
                  ),
                )),

            //! Handle connection status with reactive programming
            Obx(() {
              //* Check if the app is connected to the internet or in the initial state
              if (controller.connectionStatus.value ==
                      ConnectionStatus.connected ||
                  controller.connectionStatus.value ==
                      ConnectionStatus.initial) {
              }
              //* If the connection is lost, show an error message and a retry button
              else if (controller.connectionStatus.value ==
                  ConnectionStatus.disconnected) {
                 return Positioned.fill(
                    bottom: height * .4,
                    child: Align(
                    alignment: Alignment.bottomCenter,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                  //* Center content vertically
                  children: [
                    Text(
                      'لطفا اتصال خود را بررسی کنید!',
                      style: Get.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600
                      ), //* Style the message
                    ),
                    const Gap(10),
                    IconButton.filled(
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.monopolyColor1
                      ),
                      onPressed: () {
                        controller
                            .checkConnection(); //* Retry connection on button press
                      },
                      icon: const FaIcon(FontAwesomeIcons.arrowRotateRight,
                          color: Colors.white), //* Retry icon
                    ),
                  ],
                )));
              }
              //* If still loading, show a loading animation
              return Positioned.fill(
                bottom: height * .6,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: LoadingAnimationWidget.threeArchedCircle(
                    color: AppColors.monopolyColor1,
                    //* Use the theme’s primary color for the animation
                    size: height * .10, //* Set the size of the animation
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
