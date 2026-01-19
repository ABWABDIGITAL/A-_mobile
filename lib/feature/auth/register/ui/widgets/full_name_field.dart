import 'package:flutter/material.dart';
import '../../../../../core/widgets/primary/my_text_field.dart';

class FullNameField extends StatelessWidget {
  final TextEditingController controller;

  const FullNameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: controller,
      label: 'الاسم الكامل',
      hintText: 'أدخل اسمك',
      textInputAction: TextInputAction.next,
      prefixIcon: const Icon(Icons.person_outline),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'من فضلك أدخل اسمك الكامل';
        }
        return null;
      },
    );
  }
}