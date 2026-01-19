import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../screens/notes_screen.dart';
import 'note_details_bottom_sheet.dart';

class NotesList extends StatelessWidget {
  final List<NoteItemData> notes;

  const NotesList({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return Center(
        child: Text(
          'notes.empty'.tr(),
          style: TextStyles.font14DarkGray400Weight,
        ),
      );
    }

    return ListView.separated(
      itemCount: notes.length,
      separatorBuilder: (_, __) => SizedBox(height: 8.h),
      itemBuilder: (context, index) {
        return NoteRow(item: notes[index]);
      },
    );
  }
}

class NoteRow extends StatelessWidget {
  final NoteItemData item;

  const NoteRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => NoteDetailsBottomSheet(
            title: item.titleKey.tr(),
            description: item.descKey.tr(),
            timeText: item.timeKey.tr(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ColorsManager.dark50),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.titleKey.tr(),
              style: context.titleMedium,
            ),
            verticalSpace(4),
            Text(
              item.descKey.tr(),
              style: context.bodySmall,
            ),
            verticalSpace(4),
            Row(
              children: [
                MySvg(
                  image: 'Reminder',
                  width: 14.w,
                  height: 14.w,
                ),
                horizontalSpace(4),
                Text(
                  item.timeKey.tr(),
                  style: context.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}