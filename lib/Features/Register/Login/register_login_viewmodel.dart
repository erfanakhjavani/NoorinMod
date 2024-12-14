import 'package:get/get.dart';

import '../../../Core/UI Helper/show_snack_bar.dart';
import '../SwitchController/register_switch_controller.dart';


class RegisterLoginViewmodel extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var rememberMe = false.obs;
  var isObscured = true.obs;

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  void toggleObscured() {
    isObscured.value = !isObscured.value;
  }

  Future<void> login() async {
      showCustomSnackBar('هشدار', 'فقط مجاز به ثبت نام هستید');

  }



  void forgotPassword() {
    showCustomSnackBar('هشدار', "در نسخه های بعدی");
  }

  void signUp() {
    var switchPage = Get.find<RegisterSwitchViewmodel>();
    switchPage.position.value = !switchPage.position.value;
  }
}
