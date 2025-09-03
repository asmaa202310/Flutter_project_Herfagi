
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final IconData prefixIcon;
  final bool obscureText;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final TextInputType? keyboardType;

  const CustomTextField({
    required this.label,
    required this.hint,
    required this.controller,
    required this.validator,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    super.key,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.blue.shade900,
          fontSize: screenWidth * 0.045,
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.blueGrey),
        prefixIcon: Icon(prefixIcon, color: Colors.blue.shade400),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon, size: screenWidth * 0.055),
                onPressed: onSuffixIconPressed,
              )
            : null,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(color: Colors.blue, width: 2),
        errorBorder: _buildBorder(color: Colors.red, width: 2),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenWidth * 0.04,
        ),
        errorStyle: const TextStyle(color: Colors.red),
      ),
    );
  }

  OutlineInputBorder _buildBorder({
    double? raduis,
    Color? color,
    double? width,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(raduis ?? 12),
      borderSide: BorderSide(
        color: color ?? Colors.grey.shade400,
        width: width ?? 1,
      ),
    );
  }
}