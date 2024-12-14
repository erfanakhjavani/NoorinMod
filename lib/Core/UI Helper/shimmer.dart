
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Constants/app_colors.dart';

Widget showCustomShimmer(){
  return Shimmer.fromColors(
      period: const Duration(milliseconds: 800),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey,
      ));
}