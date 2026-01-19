import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../widgets/home_header.dart';
import '../widgets/home_quick_actions_section.dart';
import '../widgets/home_today_tasks_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';

    return Directionality(
      textDirection: isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        HomeHeader(),
                        SizedBox(height: 24),
                        HomeQuickActionsSection(),
                        SizedBox(height: 24),
                        HomeTodayTasksSection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  // Widget _buildBottomNavBar() {
  //   return BottomNavigationBar(
  //     currentIndex: _currentIndex,
  //     onTap: (index) => setState(() => _currentIndex = index),
  //     type: BottomNavigationBarType.fixed,
  //     selectedItemColor: ColorsManager.primaryColor,
  //     unselectedItemColor: ColorsManager.darkGray300,
  //     selectedLabelStyle: TextStyles.font10Primary500Weight,
  //     unselectedLabelStyle: TextStyles.font10darkGrayWeight400,
  //     items: [
  //       BottomNavigationBarItem(
  //         icon: MySvg(
  //           image: 'home-line',
  //           width: 22.w,
  //           height: 22.w,
  //           color: ColorsManager.darkGray300,
  //         ),
  //         activeIcon: MySvg(
  //           image: 'home-line',
  //           width: 22.w,
  //           height: 22.w,
  //           color: ColorsManager.primaryColor,
  //         ),
  //         label: 'home.bottom_nav_home'.tr(),
  //       ),
  //       BottomNavigationBarItem(
  //         icon: MySvg(
  //           image: 'users',
  //           width: 22.w,
  //           height: 22.w,
  //           color: ColorsManager.darkGray300,
  //         ),
  //         activeIcon: MySvg(
  //           image: 'users',
  //           width: 22.w,
  //           height: 22.w,
  //           color: ColorsManager.primaryColor,
  //         ),
  //         label: 'home.bottom_nav_communities'.tr(),
  //       ),
  //       BottomNavigationBarItem(
  //         icon: MySvg(
  //           image: 'communities',
  //           width: 22.w,
  //           height: 22.w,
  //           color: ColorsManager.darkGray300,
  //         ),
  //         activeIcon: MySvg(
  //           image: 'communities',
  //           width: 22.w,
  //           height: 22.w,
  //           color: ColorsManager.primaryColor,
  //         ),
  //         label: 'home.bottom_nav_chats'.tr(),
  //       ),
  //       BottomNavigationBarItem(
  //         icon: MySvg(
  //           image: 'calendar',
  //           width: 22.w,
  //           height: 22.w,
  //           color: ColorsManager.darkGray300,
  //         ),
  //         activeIcon: MySvg(
  //           image: 'calendar',
  //           width: 22.w,
  //           height: 22.w,
  //           color: ColorsManager.primaryColor,
  //         ),
  //         label: 'home.bottom_nav_schedule'.tr(),
  //       ),
  //       BottomNavigationBarItem(
  //         icon: MySvg(
  //           image: 'user',
  //           width: 22.w,
  //           height: 22.w,
  //           color: ColorsManager.darkGray300,
  //         ),
  //         activeIcon: MySvg(
  //           image: 'user',
  //           width: 22.w,
  //           height: 22.w,
  //           color: ColorsManager.primaryColor,
  //         ),
  //         label: 'home.bottom_nav_account'.tr(),
  //       ),
  //     ],
  //   );
  // }
}