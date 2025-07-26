import 'package:alpha_learnapp/widget/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final Color color;

  const CustomButton({
    required this.onPressed,
    required this.text,
    required this.color,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Use the color passed in constructor
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
        ),
        onPressed: isLoading ? null : onPressed, // Disable button if loading
        child: isLoading
            ? const CircularProgressIndicator(color: AppColors.background)
            : Text(
                text,
                style: const TextStyle(color: AppColors.text),
              ),
      ),
    );
  }
}
