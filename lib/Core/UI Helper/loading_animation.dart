

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget showCustomLoadingWidget(){
  return LoadingAnimationWidget.twoRotatingArc(
    color: Colors.white,
    size: 15
  );
}