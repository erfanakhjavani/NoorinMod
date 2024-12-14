
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Gen/assets.gen.dart';
import '../../../Core/Services/response_model.dart';
import 'main_wrapper_home_model.dart';

class MainWrapperHomeViewmodel extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  var state = ResponseModel<List<HomeProduct>>.loading('nothing').obs;
  RxList<HomeProduct> productList = <HomeProduct>[].obs;



  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  var images = [
    'https://karawp.com/wp-content/uploads/2024/12/%D8%A7%D9%BE%D9%84%DB%8C%DA%A9%DB%8C%D8%B4%D9%86-4.jpg',
    'https://karawp.com/wp-content/uploads/2024/12/%D8%A7%D9%BE%D9%84%DB%8C%DA%A9%DB%8C%D8%B4%D9%86-1.jpg',
    'https://karawp.com/wp-content/uploads/2024/12/%D8%A7%D9%BE%D9%84%DB%8C%DA%A9%DB%8C%D8%B4%D9%86-3.jpg',
    'https://karawp.com/wp-content/uploads/2024/12/%D8%A7%D9%BE%D9%84%DB%8C%DA%A9%DB%8C%D8%B4%D9%86-2.jpg',
  ];




  Future<void> getProducts()async {
    Dio dio = Dio();
    state.value = ResponseModel.loading('loading...');

    var response = await dio.get(
        'https://karawp.com/wp-json/wc/v3/products?consumer_key=ck_a4faf2d14732332c4cdbb47751e2334325bb36c5&consumer_secret=cs_f1faa078e00c23ee060391d5afcf4f22e213d473');
    if (response.statusCode == 200) {
      var items = (response.data as List).map((item) => HomeProduct.fromJson(item)).toList();
      state.value = ResponseModel<List<HomeProduct>>.completed(items);
      update();
    }
    else{
      state.value = ResponseModel.error('خطا در دریافت جزییات');
    }
    update();
  }


  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
