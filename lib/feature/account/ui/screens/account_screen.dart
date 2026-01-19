import 'dart:ui' as ui;

import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary/my_svg.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  void _toggleLanguage() {
    final code = context.locale.languageCode;
    context.setLocale(code == 'ar' ? const Locale('en') : const Locale('ar'));
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    final direction = isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr;
    final langValueKey =
    isArabic ? 'account.language_value_ar' : 'account.language_value_en';

    return Directionality(
      textDirection: direction,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _AccountHeader(),
                verticalSpace(24),
                const _UniversityCard(),
                verticalSpace(24),
                _SectionTitle(title: 'account.settings_section'.tr()),
                verticalSpace(12),
                AccountTile(
                  title: 'account.basic_info'.tr(),
                  iconName: 'user',
                  onTap: () {},
                ),
                AccountTile(
                  title: 'account.academic_info'.tr(),
                  iconName: 'degree-hat',
                  onTap: () {},
                ),
                AccountTile(
                  title: 'account.subscriptions'.tr(),
                  iconName: 'subscription',
                  onTap: () {},
                ),
                AccountTile(
                  title: 'account.language'.tr(),
                  trailingText: langValueKey.tr(),
                  iconName: 'globe',
                  onTap: _toggleLanguage,
                  showDivider: false,
                ),
                verticalSpace(24),
                _SectionTitle(title: 'account.support_section'.tr()),
                verticalSpace(12),
                AccountTile(
                  title: 'account.privacy_policy'.tr(),
                  iconName: 'document',
                  onTap: () {},
                ),
                AccountTile(
                  title: 'account.share_app'.tr(),
                  iconName: 'share',
                  onTap: () {},
                ),
                AccountTile(
                  title: 'account.support'.tr(),
                  iconName: 'support',
                  onTap: () {},
                  showDivider: false,
                ),
                verticalSpace(32),
                _LogoutTile(onTap: () {}),
                verticalSpace(24),
                // const _AppVersion(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AccountHeader extends StatelessWidget {
  const _AccountHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorsManager.primaryColor,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 40.r,
                backgroundImage: const AssetImage('assets/images/user.png'),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorsManager.white,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 14.sp,
                    color: ColorsManager.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Text(
          'account.greeting_name'.tr(),
          style: context.headlineSmall,
        ),

      ],
    );
  }
}

class _UniversityCard extends StatelessWidget {
  const _UniversityCard();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: ColorsManager.primary50,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: ColorsManager.primary100,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: MySvg(
                  image: 'degree-hat',
                  width: 24.w,
                  height: 24.w,
                  color: ColorsManager.primaryColor,
                ),
              ),
            ),
            horizontalSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'account.university'.tr(),
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  verticalSpace(4),
                  Text(
                    'account.major'.tr(),
                    style: context.bodySmall?.copyWith(
                      color: ColorsManager.darkGray,
                    ),
                  ),
                ],
              ),
            ),
            horizontalSpace(8),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: ColorsManager.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.labelMedium?.copyWith(
        color: ColorsManager.darkGray,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class AccountTile extends StatelessWidget {
  final String title;
  final String iconName;
  final String? trailingText;
  final VoidCallback? onTap;
  final bool showDivider;
  final Color? iconBackgroundColor;
  final Color? iconColor;

  const AccountTile({
    super.key,
    required this.title,
    required this.iconName,
    this.trailingText,
    this.onTap,
    this.showDivider = true,
    this.iconBackgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: iconBackgroundColor ?? ColorsManager.grey100,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: MySvg(
                      image: iconName,
                      width: 20.w,
                      height: 20.w,
                      color: iconColor ?? ColorsManager.primaryColor,
                    ),
                  ),
                ),
                horizontalSpace(14),
                Expanded(
                  child: Text(
                    title,
                    style: context.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (trailingText != null) ...[
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: ColorsManager.grey100,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      trailingText!,
                      style: context.labelSmall?.copyWith(
                        color: ColorsManager.darkGray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  horizontalSpace(8),
                ],
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: ColorsManager.darkGray300,
                ),
              ],
            ),
            if (showDivider) ...[
              verticalSpace(12),
              Divider(
                height: 1,
                color: ColorsManager.grey200,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _LogoutTile extends StatelessWidget {
  final VoidCallback onTap;

  const _LogoutTile({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: ColorsManager.grey100,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Icon(
                  Icons.logout_rounded,
                  size: 20.sp,
                  color: ColorsManager.primaryColor,
                ),
              ),
            ),
            horizontalSpace(14),
            Expanded(
              child: Text(
                'account.logout'.tr(),
                style: context.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  // color: ColorsManager.primaryColor,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: ColorsManager.darkGray300,
            ),
          ],
        ),
      ),
    );
  }
}

class _AppVersion extends StatelessWidget {
  const _AppVersion();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'account.version'.tr(args: ['1.0.0']),
        style: context.labelSmall?.copyWith(
          color: ColorsManager.darkGray300,
        ),
      ),
    );
  }
}