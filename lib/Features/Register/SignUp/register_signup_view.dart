import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noorin_mod/Features/Register/SignUp/register_signup_viewmodel.dart';
import '../../../Core/Constants/app_colors.dart';
import '../../../Core/Services/response_model.dart';
import '../../../Core/UI Helper/loading_animation.dart';
import '../../MainWrapper/MainWrapperBottomNav/main_wrapper_bottom_nav_view.dart';

class RegisterSignupView extends GetView<RegisterSignupViewmodel> {
  const RegisterSignupView({super.key});

  Widget _buildTextField({
    required String hintText,
    required TextEditingController controller,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        cursorColor: Colors.grey.shade600,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: Theme.of(Get.context!).textTheme.bodyMedium,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade500),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          suffixIcon: suffixIcon,
        ),
        onChanged: (value) {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width < 900 ? 24.0 : 240.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: Text(
                'شروع کنید!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 20.0),
            _buildTextField(
              hintText: 'نام',
              controller: controller.name,
            ),
            _buildTextField(
              hintText: 'نام کاربری',
              controller: controller.user,
            ),
            _buildTextField(
              hintText: 'آدرس ایمیل',
              controller: controller.email,
            ),
            Obx(()=>_buildTextField(
              hintText: 'رمز عبور',
              controller: controller.password,
              obscureText: controller.isObscured.value,
              suffixIcon: IconButton(
                onPressed: () {
                  controller.toggleObscured();
                },
                icon: Icon(
                  controller.isObscured.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.grey,
                ),
              ),
            ),),
            Obx(()=>_buildTextField(
              hintText: 'رمز عبور',
              controller: controller.rePassword,
              obscureText: controller.isObscured.value,
              suffixIcon: IconButton(
                onPressed: () {
                  controller.toggleObscured();
                },
                icon: Icon(
                  controller.isObscured.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.grey,
                ),
              ),
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Checkbox(
                  activeColor: AppColors.primary,
                  value: controller.rememberMe.value,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onChanged: (value) => controller.toggleRememberMe(),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "با شرایط و قوانین ",
                      style: TextStyle(color: Colors.black87, fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "موافقت می‌کنم",
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              width: width * 1.5,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.monopolyColor1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                    Get.offAll(
                    MainWrapperBottomNavView(),
                      transition: Transition.fadeIn,
                      duration: const Duration(seconds: 1), //* Smooth transition with 1-second duration
                      curve: Curves.easeIn, //* Use easeIn curve for the animation
                    );
                },
                child: Obx(()=> AnimatedCrossFade(
                    firstChild: Text(
                      'ثبت نام',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    secondChild: showCustomLoadingWidget(),
                    crossFadeState:
                    controller.state.value.status == Status.LOADING ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 300)
                ))
              ),
            ),
            const SizedBox(height: 45.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('یا', style: Theme.of(context).textTheme.labelLarge),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 45.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'حساب کاربری دارید؟',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextButton(
                  onPressed: controller.signIn,
                  child: Text(
                    'ورود به حساب',
                    style: Theme.of(context).textTheme.bodySmall!
                        .copyWith(color: Colors.blueAccent.shade700),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
