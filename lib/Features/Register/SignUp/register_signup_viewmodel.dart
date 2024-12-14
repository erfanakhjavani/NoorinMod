import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Core/Services/response_model.dart';
import '../../../Core/UI Helper/show_snack_bar.dart';
import '../Repository/register_repositories.dart';
import '../SwitchController/register_switch_controller.dart';

class RegisterSignupViewmodel extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  var rememberMe = false.obs;
  var isObscured = false.obs;
  var state = ResponseModel.error('nothing...').obs;

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  void toggleObscured() {
    isObscured.value = !isObscured.value;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'لطفا نام را وارد کنید!';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'لطفا ایمیل را وارد کنید!';
    } else if (!GetUtils.isEmail(value)) {
      return 'ایمیل وارد شده معتبر نیست';
    }
    return null;
  }

  String? validateUser(String value) {
    if (value.isEmpty) {
      return 'لطفا نام کاربری را وارد کنید!';
    } else if (!GetUtils.isEmail(value)) {
      return 'نام کاربری وارد شده معتبر نیست';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'رمز عبور نمی‌تواند خالی باشد';
    } else if (value.length < 6) {
      return 'رمز عبور باید حداقل 6 کاراکتر باشد';
    }
    return null;
  }

  String? validateRePassword(String value) {
    if (value != password.text) {
      return 'رمز عبور و تکرار آن مطابقت ندارند';
    }
    return null;
  }

  Future<void> register() async {
    final nameError = validateName(name.text);
    final emailError = validateEmail(email.text);
    final userError = validateUser(email.text);
    final passwordError = validatePassword(password.text);
    final rePasswordError = validateRePassword(rePassword.text);

    if (nameError != null) {
      showCustomSnackBar('خطا', nameError);
      return;
    }

    if (userError != null) {
      showCustomSnackBar('خطا', userError);
      return;
    }

    if (emailError != null) {
      showCustomSnackBar('خطا', emailError);
      return;
    }

    if (passwordError != null) {
      showCustomSnackBar('خطا', passwordError);
      return;
    }

    if (rePasswordError != null) {
      showCustomSnackBar('خطا', rePasswordError);
      return;
    }

    state.value = ResponseModel.loading('loading...');


   var response = await RegisterRepositories().postSignUp(
      {
        'email': email.text,
        'first_name': user.text,
        'username': name.text,
        'password': password.text,
      }
    );

   if(response.status == Status.COMPLETED){

     showCustomSnackBar('موفقیت', 'ثبت‌نام با موفقیت انجام شد');
     state.value = ResponseModel.completed(response.data);
   }
    showCustomSnackBar('خطا', response.message);
    state.value = ResponseModel.error(response.message);

  }





  void signIn() {
    var switchPage = Get.find<RegisterSwitchViewmodel>();
    switchPage.position.value = !switchPage.position.value;
  }
}
