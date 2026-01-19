import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/primary/my_text_field.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool isConfirmPassword;
  final TextEditingController? originalPasswordController;

  const PasswordField({
    super.key,
    required this.controller,
    this.label,
    this.hintText,
    this.validator,
    this.isConfirmPassword = false,
    this.originalPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return MyTextField.password(
      controller: controller,
      label: label ?? tr(isConfirmPassword ? 'confirm_password_label' : 'password_label'),
      hintText: hintText ?? tr(isConfirmPassword ? 'confirm_password_hint' : 'password_hint'),
      validator: validator ?? _defaultValidator,
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr('password_required');
    }
    if (value.length < 8) {
      return tr('password_min_length');
    }
    if (isConfirmPassword &&
        originalPasswordController != null &&
        value != originalPasswordController!.text) {
      return tr('passwords_not_match');
    }
    return null;
  }
}