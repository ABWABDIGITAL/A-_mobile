import 'dart:ui' as ui;

import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/my_button.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../../../../core/widgets/primary/my_text_field.dart';

class CreateCommunityBottomSheet extends StatefulWidget {
  const CreateCommunityBottomSheet({super.key});

  @override
  State<CreateCommunityBottomSheet> createState() =>
      _CreateCommunityBottomSheetState();
}

class _CreateCommunityBottomSheetState
    extends State<CreateCommunityBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _onCreate() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';

    return Directionality(
      textDirection: isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24.r),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'communities.create_title'.tr(),
                        style: context.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                        color: ColorsManager.darkGray,
                      ),
                    ],
                  ),
                  verticalSpace(16),
                  Center(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 48.r,
                              backgroundImage: const AssetImage(
                                'assets/images/communities.png',
                              ),
                            ),
                            Container(
                              width: 26.w,
                              height: 26.w,
                              decoration: BoxDecoration(
                                color: ColorsManager.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: MySvg(
                                  image: 'camera',
                                  width: 16.w,
                                  height: 16.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(8),
                        Text(
                          'communities.create_add_image'.tr(),
                          style: context.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(24),

                  // Name Field - Using MyTextField
                  MyTextField(
                    controller: _nameController,
                    label: 'communities.create_name_label'.tr(),
                    hintText: 'communities.create_name_hint'.tr(),
                    borderRadius: 8.r,
                  ),

                  verticalSpace(16),

                  // Description Field - Using MyTextField.multiline
                  MyTextField.multiline(
                    controller: _descController,
                    label: 'communities.create_desc_label'.tr(),
                    hintText: 'communities.create_desc_hint'.tr(),
                    maxLines: 4,
                    minLines: 4,
                    borderRadius: 8.r,
                  ),

                  verticalSpace(24),
                  MyButton(
                    onPressed: _onCreate,
                    height: 48.h,
                    radius: 8.r,
                    backgroundColor: ColorsManager.primaryColor,
                    label: 'communities.create_button'.tr(),
                    labelStyle: TextStyles.font14White500Weight,
                  ),
                  verticalSpace(16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}