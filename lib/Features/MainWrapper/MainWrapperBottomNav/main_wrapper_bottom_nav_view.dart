import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../Core/Constants/app_colors.dart';
import '../MainWrapperBasket/main_wrapper_basket_view.dart';
import '../MainWrapperBlog/main_wrapper_blog_view.dart';
import '../MainWrapperHome/main_wrapper_home_view.dart';
import '../MainWrapperProfile/main_wrapper_profile_view.dart';
import 'main_wrapper_bottom_nav_model.dart';
import 'main_wrapper_bottom_nav_viewmodel.dart';

class MainWrapperBottomNavView extends GetView<MainWrapperBottomNavViewmodel> {
  MainWrapperBottomNavView({super.key});

  final List<MainWrapperBottomNavModel> items = [
    MainWrapperBottomNavModel(
        title: 'خانه',
        iconPath: FontAwesomeIcons.house,
        pageRoute:  const MainWrapperHomeView()),
    MainWrapperBottomNavModel(
        title: 'کاوش',
        iconPath: FontAwesomeIcons.blog,
        pageRoute:  MainWrapperBlogView()),
    MainWrapperBottomNavModel(
        title: 'سبد خرید',
        iconPath: FontAwesomeIcons.basketShopping,
        pageRoute: const MainWrapperBasketView()),
    MainWrapperBottomNavModel(
        title: 'حساب من',
        iconPath: FontAwesomeIcons.userLarge,
        pageRoute:  const MainWrapperProfileView()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return items[controller.selectedIndex.value].pageRoute;
      }),
      bottomNavigationBar: Obx(() {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.onTabSelected,
            elevation: 0,
            selectedItemColor: AppColors.monopolyColor1,
            unselectedItemColor: Colors.grey,
            items: items.map((item) {
              return BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(item.iconPath),
                label: item.title,
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
