import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../Core/Constants/app_colors.dart';
import '../../../Core/Gen/assets.gen.dart';
import '../../../Core/Services/response_model.dart';
import '../../../Core/UI Helper/format_digits.dart';
import '../../../Core/UI Helper/shimmer.dart';
import '../../../Core/UI Helper/show_snack_bar.dart';
import '../../../Core/UI Helper/try_again.dart';
import '../../SingleProduct/single_product_v.dart';
import 'main_wrapper_home_viewmodel.dart';

class MainWrapperHomeView extends GetView<MainWrapperHomeViewmodel> {
  const MainWrapperHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(),
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 7, left: 5, right: 5),
                child: GetBuilder<MainWrapperHomeViewmodel>(
                  builder: (controller) {
                    return _pageViewWithIndicator(controller);
                  },
                ),
              ),
              _buildCategorySection(),
              _buildPopularProductsSection(),
              _buildPromotionalBanner(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSmoothPageIndicator(MainWrapperHomeViewmodel controller) {
    return SmoothPageIndicator(
      controller: controller.pageController,
      count: controller.images.length,
      effect: JumpingDotEffect(
          dotWidth: 10,
          dotHeight: 10,
          dotColor: AppColors.monopolyColor1,
          activeDotColor: Colors.blueGrey
      ),
      onDotClicked: (index) => controller.pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      toolbarHeight: Get.height / 12,
      title: Assets.png.title.image(
        width: Get.width / 1.6,
        height: Get.height / 12,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () async{
            showCustomSnackBar("هشدار", "در حال بروزرسانی...");
          },
        ),

      ],
    );
  }

  Drawer _drawer() {
    return  Drawer(
      child: Center(
        child: TryWidget(
            text: 'بروزرسانی خواهد شد',
            lottieName: 'arrowUp',
            repeat: true),
      ),
    );
  }

  Widget _pageViewWithIndicator(
      MainWrapperHomeViewmodel controller
      ) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: controller.images.length,
              itemBuilder: (context, index) => _pageReader(controller.images[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3,),
            child: buildSmoothPageIndicator(controller),
          ),
        ],
      ),
    );
  }

  Widget _pageReader(String image) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, left: 5, right: 5),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: Image.network(
          image,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return showCustomShimmer();
          },
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.broken_image,
            size: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Gap(15),
          SizedBox(
            height: 100,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                if(controller.state.value.status == Status.LOADING){
                  return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade400,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: AppColors.monopolyColor1,
                              child: const Icon(Icons.category, color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      )
                  );
                }
                if(controller.state.value.status == Status.COMPLETED){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.monopolyColor1,
                          child: const Icon(Icons.category, color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Text(controller.state.value.data[index].category.tr,style: Get.textTheme.labelLarge,)
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )),

        ],
      ),
    );
  }

  Widget _buildPopularProductsSection() {
    return GetBuilder<MainWrapperHomeViewmodel>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "کالاهای پرفروش".tr,
              style: Get.theme.textTheme.bodyMedium,
            ),
            const Gap(10),
            SizedBox(
              height: Get.height / 2.6,
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  if(controller.state.value.status == Status.LOADING){
                    const _ProductCardShimmer();
                  }
                  if(controller.state.value.status == Status.COMPLETED){

                    var item = controller.state.value.data[index];
                    return GestureDetector(
                      onTap: () {

                        Get.to(
                              SingleProductV(
                               id: item.id,
                             ),

                            duration: const Duration(milliseconds: 300),
                            transition: Transition.fadeIn
                        );
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        shadowColor: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SizedBox(
                          width: Get.width / 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                child: Image.network(
                                  item.imageUrl,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  item.name.tr,
                                  style: Get.textTheme.bodySmall,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(item.category
                                ,style: Get.textTheme.labelLarge!.copyWith(
                                    color: Colors.grey[600]
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.bottomCenter
                                ,child: Padding(
                                  padding: const EdgeInsets.only(bottom: 7,right: 50),
                                  child: Text(
                                    '${formatNumberWithCommas(item.price).toPersianDigit()} تومان',
                                    overflow: TextOverflow.ellipsis,
                                    style: Get.textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      );
    });
  }



  Widget _buildPromotionalBanner() {
    if (controller.images.isEmpty) {
      return const SizedBox.shrink(); // نمایش بدون محتوا اگر تصاویر خالی هستند
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          controller.images[0],
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.error_outline,
            size: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

}



class _ProductCardShimmer extends StatelessWidget {
  const _ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[400]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 16,
                  width: 100,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 14,
                  width: 80,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 7, right: 30),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 14,
                    width: 120,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
