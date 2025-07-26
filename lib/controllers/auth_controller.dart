import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // Input controllers
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Display values for profile
  final displayName = ''.obs;
  final displayUsername = ''.obs;
  final displayEmail = ''.obs;

  var obscurePassword = true.obs;
  var isLoading = false.obs;

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void signUp() {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;

      Future.delayed(const Duration(seconds: 2), () {
        // Set observable display values after successful sign-up
        displayName.value = nameController.text;
        displayUsername.value = usernameController.text;
        displayEmail.value = emailController.text;

        isLoading.value = false;
        Get.snackbar("Success", "Account created!");
        Get.offAllNamed('/main');
      });
    }
  }

  void signIn() {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;

      Future.delayed(const Duration(seconds: 2), () {
        // Optionally populate display values on login
        displayName.value = nameController.text;
        displayUsername.value = usernameController.text;
        displayEmail.value = emailController.text;

        isLoading.value = false;
        Get.snackbar("Success", "Login successful");
        Get.offAllNamed('/main');
      });
    }
  }

  void resetPassword(String newPassword) {
    // Add your password reset logic here
    print('Password reset to: $newPassword');
    Get.snackbar("Success", "Password has been reset");
  }

  @override
  void onClose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
