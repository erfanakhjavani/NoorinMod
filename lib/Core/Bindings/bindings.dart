import 'package:get/get.dart';

import '../../Features/MainWrapper/MainWrapperBasket/main_wrapper_basket_viewmodel.dart';
import '../../Features/MainWrapper/MainWrapperBlog/main_wrapper_blog_viewmodel.dart';
import '../../Features/MainWrapper/MainWrapperBottomNav/main_wrapper_bottom_nav_viewmodel.dart';
import '../../Features/MainWrapper/MainWrapperHome/main_wrapper_home_viewmodel.dart';
import '../../Features/MainWrapper/MainWrapperProfile/main_wrapper_profile_viewmodel.dart';
import '../../Features/Register/Login/register_login_viewmodel.dart';
import '../../Features/Register/SignUp/register_signup_viewmodel.dart';
import '../../Features/Register/SwitchController/register_switch_controller.dart';
import '../../Features/SingleProduct/single_product_vm.dart';
import '../../Features/Splash/splash_viewmodel.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {

    Get.put(SplashViewmodel());


    //! SingleProduct
    Get.put(SingleProductVm());


    //! MainWrapper
    Get.put( MainWrapperBottomNavViewmodel());
    Get.put(MainWrapperHomeViewmodel());
    Get.put(MainWrapperProfileViewmodel());
    Get.put(MainWrapperBlogViewmodel());
    Get.put(MainWrapperBasketViewmodel());



    //! Register
    Get.lazyPut(()=> RegisterLoginViewmodel());
    Get.lazyPut(()=> RegisterSwitchViewmodel());
    Get.lazyPut(()=> RegisterSignupViewmodel());





  }
}
