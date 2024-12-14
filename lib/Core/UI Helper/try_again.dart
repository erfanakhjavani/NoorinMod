import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

import '../Constants/app_colors.dart';


Widget Loading(){
  return  Center(
      child: LoadingAnimationWidget.twoRotatingArc(
          color: AppColors.monopolyColor1, size: 30));
}




Widget TryAgain(GetxController controller,VoidCallback onPressed) {

  return Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TryWidget(text: 'لطفا اینترنت خود را متصل کنید',
          lottieName: "disconnect",
          repeat: true),
      TextButton(
          onPressed: onPressed, child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.refresh,color: AppColors.monopolyColor1,),
          Text("تلاش مجدد",style: Get.textTheme.bodyMedium,)
        ],))

    ],
  ));
}


Widget TryWidget({required String text,required String lottieName,required bool repeat}) {

  return Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Lottie.asset('assets/json/${lottieName}.json',
          repeat: repeat,
          height: Get.height * 0.30,
          width: double.infinity,
          fit: BoxFit.fitHeight
      ),
      Text(text,style: Get.textTheme.bodySmall,),


    ],
  ));
}





