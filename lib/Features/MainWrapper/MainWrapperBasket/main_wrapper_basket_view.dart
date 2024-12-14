

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/UI Helper/try_again.dart';
import 'main_wrapper_basket_viewmodel.dart';

class MainWrapperBasketView extends GetView<MainWrapperBasketViewmodel> {
  const MainWrapperBasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return TryWidget(
        text: 'بروزرسانی خواهد شد',
        lottieName: 'arrowUp',
        repeat: true);
  }
}
