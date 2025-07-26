import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alpha_learnapp/controllers/auth_controller.dart';
import 'package:alpha_learnapp/utils/validators.dart';
import 'package:alpha_learnapp/widget/colors.dart';
import 'package:alpha_learnapp/widget/custom_input.dart';
import 'package:alpha_learnapp/widget/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Sign Up'),
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
                  'Let\'s sign you up',
                  style: TextStyle(fontSize: 16, color: AppColors.text),
                ),
                const SizedBox(height: 20),

                // Full Name
                CustomInputField(
                  hint: 'Full Name',
                  controller: controller.nameController,
                  validator: Validators.validateNotEmpty,
                ),
                const SizedBox(height: 16),

                // Username
                CustomInputField(
                  hint: 'Username',
                  controller: controller.usernameController,
                  validator: Validators.validateUsername,
                ),
                const SizedBox(height: 16),

                // Email
                CustomInputField(
                  hint: 'Email',
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                ),
                const SizedBox(height: 16),

                // Password with Obx to toggle obscureText
                Obx(() => CustomInputField(
                      hint: 'Password',
                      controller: controller.passwordController,
                      validator: Validators.validatePassword,
                      obscureText: controller.obscurePassword.value,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          semanticLabel: controller.obscurePassword.value
                              ? 'Show password'
                              : 'Hide password',
                        ),
                        onPressed: controller.togglePassword,
                      ),
                    )),
                const SizedBox(height: 30),

                // Sign Up Button with 2-second delay before signUp
                Obx(() {
                  final isLoading = controller.isLoading.value;

                  VoidCallback? onPressedCallback;
                  if (!isLoading) {
                    onPressedCallback = () {
                      final form = controller.formKey.currentState;
                      if (form != null && form.validate()) {
                        Future.delayed(const Duration(seconds: 2), () {
                          controller.signUp();
                        });
                      }
                    };
                  } else {
                    onPressedCallback = null;
                  }

                  return CustomButton(
  text: isLoading ? 'Creating Account...' : 'Sign Up',
  onPressed: onPressedCallback ?? () {},  // Provide empty function if null
  color: isLoading ? AppColors.grey : AppColors.primary,
);
                }),

                const SizedBox(height: 20),

                // Divider with "OR"
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

                // Social Login (Placeholder buttons)
                const SizedBox(height: 20),

                // Navigation to Sign In
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    InkWell(
                      onTap: () => Get.toNamed('/sign_in'),
                      child: const Text(
                        'Sign In',
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
