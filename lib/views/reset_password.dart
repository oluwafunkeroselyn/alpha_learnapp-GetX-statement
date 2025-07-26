import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alpha_learnapp/controllers/auth_controller.dart';

class ResetPassword extends StatefulWidget {
  final AuthController controller;

  const ResetPassword({required this.controller, super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.controller.resetPassword(newPasswordController.text);
      Get.back(); // Close the dialog
      Get.snackbar('Success', 'Password has been reset');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: newPasswordController,
            obscureText: obscureNewPassword,
            decoration: InputDecoration(
              labelText: 'New Password',
              suffixIcon: IconButton(
                icon: Icon(
                  obscureNewPassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () => setState(() => obscureNewPassword = !obscureNewPassword),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter new password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: confirmPasswordController,
            obscureText: obscureConfirmPassword,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              suffixIcon: IconButton(
                icon: Icon(
                  obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () => setState(() => obscureConfirmPassword = !obscureConfirmPassword),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm password';
              }
              if (value != newPasswordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Reset Password'),
          ),
        ],
      ),
    );
  }
}
