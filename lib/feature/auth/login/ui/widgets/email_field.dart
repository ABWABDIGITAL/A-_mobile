import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/primary/my_text_field.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const EmailField({
    super.key,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return MyTextField.email(
      controller: controller,
      label: tr('email_label'),
      hintText: tr('email_hint'),
      validator: validator ??
              (value) {
            if (value == null || value.trim().isEmpty) {
              return tr('email_required');
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return tr('email_invalid');
            }
            return null;
          },
    );
  }
}