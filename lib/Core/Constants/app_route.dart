import 'package:get/get.dart';

import '../../Features/MainWrapper/MainWrapperBottomNav/main_wrapper_bottom_nav_view.dart';
import '../../Features/MainWrapper/MainWrapperHome/main_wrapper_home_view.dart';
import '../../Features/Register/Login/register_login_view.dart';
import '../../Features/Register/SignUp/register_signup_view.dart';
import '../../Features/SingleProduct/single_product_v.dart';
import '../../Features/Splash/splash_view.dart';
import '../Widgets/animate_switch.dart';

class AppRoute {

  //! other
  static const String singleProduct = "/singleProduct";

  //! intro
  static const String introSplashView = '/introSplash';
  static const String introMainView = '/introMain';
  static const String introWelcomeView = '/introWelcome';


  //! main wrapper
  static const String mainWrapperBottomNavView = '/mainWrapperBottomNav';
  static const String mainWrapperHomeView = '/mainWrapperHome';
  static const String mainWrapperProfileView = '/mainWrapperProfile';



  //! register
  static const String registerSwitchView = '/registerSwitch';
  static const String registerSignupView = '/registerSignup';
  static const String registerLoginView = '/registerLogin';

  static List<GetPage> pages = [


    //! Get
     GetPage(name: introSplashView, page: () =>  const SplashView()),


    //! main wrapper
    GetPage(name: mainWrapperBottomNavView, page: () => MainWrapperBottomNavView()),
    GetPage(name: mainWrapperHomeView, page: () =>  const MainWrapperHomeView()),





    //! register
    GetPage(name: registerSwitchView, page: () => const RegisterSwitchView()),
    GetPage(name: registerSignupView, page: () => const RegisterSignupView()),
    GetPage(name: registerLoginView, page: () => const RegisterLoginView()),
  ];
}
