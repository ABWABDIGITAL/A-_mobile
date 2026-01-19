// import 'package:flutter/material.dart';
//
// import '../../../../../core/helpers/utils/spacing.dart';
// import '../../../../../core/theme/colors.dart';
// import '../../../../../core/theme/text_styles.dart';
//
// class PasswordRulesSection extends StatelessWidget {
//   const PasswordRulesSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: const [
//         PasswordRuleItem(
//           text: 'يجب أن يتكون من 8 أحرف على الأقل',
//         ),
//         SizedBox(height: 4),
//         PasswordRuleItem(
//           text: 'يجب أن يحتوي على حرف خاص واحد على الأقل',
//         ),
//       ],
//     );
//   }
// }
//
// class PasswordRuleItem extends StatelessWidget {
//   final String text;
//
//   const PasswordRuleItem({
//     super.key,
//     required this.text,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(
//           Icons.check_circle,
//           size: 18,
//           color: ColorsManager.darkGray300,
//         ),
//         horizontalSpace(8),
//         Expanded(
//           child: Text(
//             text,
//             style: TextStyles.font12DarkGray400Weight,
//           ),
//         ),
//       ],
//     );
//   }
// }