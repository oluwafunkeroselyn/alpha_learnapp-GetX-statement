import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alpha_learnapp/controllers/auth_controller.dart';
import 'package:alpha_learnapp/utils/validators.dart';
import 'package:alpha_learnapp/widget/colors.dart';
import 'package:alpha_learnapp/widget/custom_input.dart';
import 'package:alpha_learnapp/widget/custom_button.dart';

// Import your ResetPasswordForm widget
import 'package:alpha_learnapp/views/reset_password.dart'; // Adjust path as necessary

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: AppColors.primary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/a for alpha.png',
                        height: 80,
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Alpha Learn\nCampus Anywhere',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Welcome back! Please sign in to continue.',
                  style: TextStyle(fontSize: 16, color: AppColors.text),
                ),
                const SizedBox(height: 20),

                // Email Input
                CustomInputField(
                  hint: 'Enter your email',
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                ),
                const SizedBox(height: 16),

                // Password Input
                Obx(() => CustomInputField(
                      hint: 'Enter your password',
                      controller: controller.passwordController,
                      obscureText: controller.obscurePassword.value,
                      validator: Validators.validatePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: controller.togglePassword,
                      ),
                    )),
                const SizedBox(height: 10),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Reset Password',
                        content: ResetPassword(controller: controller),
                        barrierDismissible: false,
                      );
                    },
                    child: const Text("Forgot Password?"),
                  ),
                ),
                const SizedBox(height: 30),

                // Sign In Button
                Obx(() {
                  final isLoading = controller.isLoading.value;

                  VoidCallback? onPressedCallback;
                  if (!isLoading) {
                    onPressedCallback = () {
                      final form = controller.formKey.currentState;
                      if (form != null && form.validate()) {
                        controller.signIn();
                      }
                    };
                  }

                  return CustomButton(
                    text: isLoading ? 'Signing In...' : 'Sign In',
                    onPressed: onPressedCallback ?? () {},
                    color: isLoading ? AppColors.grey : AppColors.primary,
                  );
                }),

                const SizedBox(height: 20),

                // Divider
                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text('OR'),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),

                // Social login (Placeholder)
                const SizedBox(height: 20),

                // Navigation to Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    InkWell(
                      onTap: () => Get.toNamed('/sign_up'),
                      child: const Text(
                        'Sign Up Now',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
