import 'package:a_plus/feature/notifications/ui/screens/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import 'my_svg.dart';

class NotificationBellWithBadge extends StatelessWidget {
  final int count;


  const NotificationBellWithBadge({
    super.key,
    required this.count,

  });

  @override
  Widget build(BuildContext context) {
    final text = count > 9 ? '9+' : count.toString();

    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsScreen()));
      },
      borderRadius: BorderRadius.circular(20.r),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.dark50,
            ),
            child: MySvg(
              image: 'notification',
              width: 22.w,
              height: 22.w,
              color: ColorsManager.black,
            ),
          ),
          if (count > 0)
            PositionedDirectional(
              top: -2,
              end: -2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: ColorsManager.primaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  text,
                  style: TextStyles.font10White500Weight,
                ),
              ),
            ),
        ],
      ),
    );
  }
}