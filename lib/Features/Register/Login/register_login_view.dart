import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:noorin_mod/Features/Register/Login/register_login_viewmodel.dart';

import '../../../Core/Constants/app_colors.dart';
import '../../../Core/Gen/assets.gen.dart';

class RegisterLoginView extends GetView<RegisterLoginViewmodel> {
  const RegisterLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Lottie.asset(Assets.json.waveloop),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: width < 900 ? 24.0 : 240.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'خوش آمدید!',
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'لطفا ایمیل را وارد کنید تا با شما در ارتباط باشیم.',
                    style: textTheme.bodyMedium,


                  ),
                  const SizedBox(height: 30.0),

                  // Email TextField
                  _buildTextField(
                    textTheme: textTheme,
                    labelText: 'ایمیل',
                    hintText: 'مثلا noorinmod@example.com',
                    isPasswordField: false,
                  ),
                  const SizedBox(height: 15.0),

                  // Password TextField
                  Obx(
                        () => _buildTextField(
                      textTheme: textTheme,
                      hintText: 'مثلا Norin!^MoD_1234',
                      labelText: 'رمز عبور',
                      isPasswordField: true,
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Remember Me Checkbox
                  Row(
                    children: [
                      Obx(
                            () => Checkbox(
                          activeColor: AppColors.monopolyColor1,
                          value: controller.rememberMe.value,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onChanged: (value) => controller.toggleRememberMe(),
                        ),
                      ),
                      Text(
                        'مرا به خاطر بسپار',
                        style: textTheme.bodySmall,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: controller.forgotPassword,
                        child: Text(
                          'فراموشی رمز عبور؟',
                          style: textTheme.bodySmall?.copyWith(
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.monopolyColor1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: controller.login,
                      child: Text(
                        'ورود',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),

                  // Divider with OR
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('یا', style: textTheme.bodySmall),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 25.0),

                  // Sign Up Prompt
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'کاربر جدید هستید؟',
                        style: textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: controller.signUp,
                        child: Text(
                          'ثبت نام',
                          style: textTheme.bodyMedium?.copyWith(
                            color: Colors.blueAccent.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextTheme textTheme,
    required String hintText,
    required String labelText,
    required bool isPasswordField,
  }) {
    return TextField(
      cursorColor: Colors.grey.shade600,
      obscureText: isPasswordField && controller.isObscured.value,
      style: textTheme.bodyMedium,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.monopolyColor1, width: 1.5),
        ),
        labelStyle: Get.textTheme.bodyMedium,
        hintText: hintText,
        labelText: labelText,
        suffixIcon: isPasswordField
            ? IconButton(
          onPressed: controller.toggleObscured,
          icon: Icon(
            controller.isObscured.value
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.grey,
          ),
        )
            : null,
      ),
      onChanged: (value) {
        if (isPasswordField) {
          controller.password.value = value;
        } else {
          controller.email.value = value;
        }
      },
    );
  }
}
