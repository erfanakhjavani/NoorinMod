import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Core/UI Helper/try_again.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../Core/Constants/app_colors.dart';
import '../../../Core/Gen/assets.gen.dart';
import 'main_wrapper_profile_viewmodel.dart';

class MainWrapperProfileView extends GetView<MainWrapperProfileViewmodel> {
  const MainWrapperProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.start,
      drawerEdgeDragWidth: width,
      drawer: Drawer(
        width: width * 0.8,
        child: Center(
          child: TryWidget(
              text: 'بروزرسانی خواهد شد',
              lottieName: 'arrowUp',
              repeat: true),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'kara_group',
              style: TextStyle(
                color: AppColors.monopolyColor2,
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.pagelines,
                color: AppColors.monopolyColor2,
                size: width * 0.07,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildAvatar(
                    imagePath: Assets.png.logoIcon.path,
                    index: 0,
                    size: width * 0.13,
                  ),
                  const Spacer(),
                  _buildStatsRow(width),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'گروه طراحی وبسایت و اپلیکیشن کارا',
                style: Get.textTheme.bodyLarge,
              ),

              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildAvatar(
                        imagePath: Assets.png.logo.path,
                        index: 1,
                        size: width * 0.07),
                    _buildAvatar(
                        imagePath: Assets.png.logo.path,
                        index: 2,
                        size: width * 0.07),
                    _buildAvatar(
                        imagePath: Assets.png.logo.path,
                        index: 3,
                        size: width * 0.07),
                    _buildAvatar(
                        imagePath: Assets.png.logo.path,
                        index: 4,
                        size: width * 0.07),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      radius: width * 0.07,
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.add,
                        color: AppColors.monopolyColor1,
                        size: width * 0.05,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: AppColors.monopolyColor2,
                      labelColor: AppColors.monopolyColor2,
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Tab(text: 'پست ها'),
                        Tab(text: 'تگ ها'),
                      ],
                    ),
                    SizedBox(
                      height: 400,
                      child: TabBarView(
                        children: [
                          _buildPostsTab(),
                          _buildMentionsTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsRow(double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16), // فاصله عمودی
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStat('پست', '0', width),
          VerticalDivider(
            color: Colors.grey[300],
            thickness: 1,
            width: 20,
            indent: 10,
            endIndent: 10,
          ),
          _buildStat('دنبال کننده', '12.3 هزار'.toPersianDigit(), width),
          VerticalDivider(
            color: Colors.grey[300],
            thickness: 1,
            width: 20,
            indent: 10,
            endIndent: 10,
          ),
          _buildStat('دنبال شونده', '245'.toPersianDigit(), width),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String count, double width) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: width * 0.05, // اندازه متناسب با عرض صفحه
            fontWeight: FontWeight.bold,
            color: AppColors.monopolyColor2, // رنگ اصلی
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: width * 0.035,
            color: Colors.grey[700], // رنگ متن
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(
      {required String imagePath, required int index, required double size}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          controller.toggleAvatarClicked(index);
        },
        child: Obx(() {
          Color borderColor = controller.avatarBorderColor(index);
          bool isLoading = controller.isLoading[index];
          return Stack(
            alignment: Alignment.center,
            children: [
              if (isLoading)
                SpinKitRing(
                  color: AppColors.monopolyColor1,
                  size: size * 2.5,
                  lineWidth: 2.0,
                ),
              Container(
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isLoading ? Colors.transparent : borderColor,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: size,
                  backgroundImage: AssetImage(imagePath),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildPostsTab() {
    return  Center(
      child: TryWidget(text: 'متاسفانه پستی یافت نشده', lottieName: 'empty', repeat: true),
    );
  }

  Widget _buildMentionsTab() {
    return const Center(child: Text("Mentions Content"));
  }
}
