import 'dart:ui' as ui;

import 'package:a_plus/feature/account/ui/screens/account_screen.dart';
import 'package:a_plus/feature/chats/ui/screens/chats_screen.dart';
import 'package:a_plus/feature/schedule/ui/screens/schedule_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../../../communities/ui/screens/communities_screen.dart';
import 'home_screen.dart';


class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _currentIndex = 0;

  // الشاشات الخاصة بكل تبويب
  final List<Widget> _screens = const [
    HomeScreen(),
    CommunitiesScreen(),
   ChatsScreen(),
    ScheduleScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    final direction = isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr;

    return Directionality(
      textDirection: direction,
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => setState(() => _currentIndex = index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.primaryColor,
      unselectedItemColor: ColorsManager.darkGray300,
      selectedLabelStyle: TextStyles.font10Primary500Weight,
      unselectedLabelStyle: TextStyles.font10darkGrayWeight400,
      items: [
        BottomNavigationBarItem(
          icon: MySvg(
            image: 'home-line',
            width: 22.w,
            height: 22.w,
            color: ColorsManager.darkGray300,
          ),
          activeIcon: MySvg(
            image: 'home-line',
            width: 22.w,
            height: 22.w,
            color: ColorsManager.primaryColor,
          ),
          label: 'home.bottom_nav_home'.tr(),
        ),
        BottomNavigationBarItem(
          icon: MySvg(
            image: 'users',
            width: 22.w,
            height: 22.w,
            color: ColorsManager.darkGray300,
          ),
          activeIcon: MySvg(
            image: 'users',
            width: 22.w,
            height: 22.w,
            color: ColorsManager.primaryColor,
          ),
          label: 'home.bottom_nav_communities'.tr(),
        ),
        BottomNavigationBarItem(
          icon: MySvg(
            image: 'communities',
            width: 22.w,
            height: 22.w,
            color: ColorsManager.darkGray300,
          ),
          activeIcon: MySvg(
            image: 'communities',
            width: 22.w,
            height: 22.w,
            color: ColorsManager.primaryColor,
          ),
          label: 'home.bottom_nav_chats'.tr(),
        ),
        BottomNavigationBarItem(
          icon: MySvg(
            image: 'calendar',
            width: 22.w,
            height: 22.w,
            color: ColorsManager.darkGray300,
          ),
          activeIcon: MySvg(
            image: 'calendar',
            width: 22.w,
            height: 22.w,
            color: ColorsManager.primaryColor,
          ),
          label: 'home.bottom_nav_schedule'.tr(),
        ),
        BottomNavigationBarItem(
          icon: MySvg(
            image: 'user',
            width: 22.w,
            height: 22.w,
            color: ColorsManager.darkGray300,
          ),
          activeIcon: MySvg(
            image: 'user',
            width: 22.w,
            height: 22.w,
            color: ColorsManager.primaryColor,
          ),
          label: 'home.bottom_nav_account'.tr(),
        ),
      ],
    );
  }
}