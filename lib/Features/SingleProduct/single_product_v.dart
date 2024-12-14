import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:noorin_mod/Features/SingleProduct/single_product_vm.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../Core/Constants/app_colors.dart';
import '../../Core/Services/response_model.dart';
import '../../Core/UI Helper/format_digits.dart';
import '../../Core/UI Helper/try_again.dart';

class SingleProductV extends StatefulWidget {
  final int id;
  const SingleProductV({super.key, required this.id});

  @override
  State<SingleProductV> createState() => _SingleProductVState();
}

class _SingleProductVState extends State<SingleProductV> {
  final SingleProductVm controller = Get.find<SingleProductVm>();


  @override
  void initState() {
    controller.getProducts(widget.id);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleProductVm>(
        builder: (controller){
          if(controller.state.status == Status.COMPLETED){
           return _CompleteWidget(controller: controller,);
          }
          if(controller.state.status == Status.LOADING){
            return const Scaffold(
              body: _LoadingWidget(),
            );
          }
          return Scaffold(

            body: _ErrorWidgets(controller: controller,id: widget.id,),
          );
        });
  }
}

class _CompleteWidget extends StatelessWidget {
  final SingleProductVm controller;
  const _CompleteWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var item = controller.state.data;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          item.name,
          style: Get.textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.network(
                    item.imageUrl,
                    height: Get.height / 2.2,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(item.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

            const SizedBox(height: 8),
            Obx(
                  () => Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  Text(
                    controller.productRating.value.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text("انتخاب رنگ"),
            Obx(
                  () => Row(
                children: controller.colors
                    .map((color) => GestureDetector(
                  onTap: () => controller.selectedColor.value = color,
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: color == 'مشگی' ? Colors.black : color == 'قرمز' ? Colors.red
                          : color == 'سبز' ? Colors.green : color == 'سفید' ? Colors.grey[300] : Colors.black ,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: controller.selectedColor.value == color
                            ? Colors.blue
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    width: 30,
                    height: 30,
                  ),
                ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
            const Text("انتخاب اندازه"),
            Obx(
                  () => Row(
                children: controller.storages
                    .map((storage) => GestureDetector(
                  onTap: () => controller.selectedStorage.value = storage,
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: controller.selectedStorage.value == storage
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(storage),
                  ),
                ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child:  Text("مشخصات فنی",style: Get.textTheme.bodySmall,),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child:  Text("توضیحات محصول",style: Get.textTheme.bodySmall,),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child:  Text("نظرات کاربران",style: Get.textTheme.bodySmall,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${formatNumberWithCommas(item.regularPrice).toPersianDigit()} تومان',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        '${formatNumberWithCommas(item.price).toPersianDigit()} تومان',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                ElevatedButton(

                  onPressed: () {},
                  child:  Text("افزودن به سبد خرید",style: Get.textTheme.bodySmall!.copyWith(
                    color: AppColors.monopolyColor1,
                    fontWeight: FontWeight.w700
                  ),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Loading();
  }
}


class _ErrorWidgets extends StatelessWidget {
  final SingleProductVm controller;
  final int id;
  const _ErrorWidgets({required this.controller,super.key,required this.id});

  @override
  Widget build(BuildContext context) {

    return TryAgain(controller,(){
      controller.getProducts(id);
      controller.update();
    });
  }
}



