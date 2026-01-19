import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/utils/spacing.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../primary/my_button.dart';

class SelectionBottomSheet extends StatefulWidget {
  final String title;
  final String subtitle;
  final String searchHint;
  final List<String> items;
  final String? initialValue;

  const SelectionBottomSheet({
    super.key,
    required this.title,
    required this.subtitle,
    required this.searchHint,
    required this.items,
    this.initialValue,
  });

  @override
  State<SelectionBottomSheet> createState() => _SelectionBottomSheetState();
}

class _SelectionBottomSheetState extends State<SelectionBottomSheet> {
  String? _selected;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _selected = widget.initialValue;
  }

  List<String> get _filteredItems {
    if (_query.trim().isEmpty) return widget.items;
    final q = _query.trim().toLowerCase();
    return widget.items
        .where((e) => e.toLowerCase().contains(q))
        .toList();
  }

  void _onSave() {
    Navigator.pop(context, _selected);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
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
          child: SizedBox(
            height: 0.8.sh,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                      widget.title,
                      style: TextStyles.font20Black500Weight,
                      textAlign: TextAlign.center,
                    ),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                          color: ColorsManager.darkGray,
                        ),
                      ),
                    ],
                  ),

                  verticalSpace(4),
                  Text(
                    widget.subtitle,
                    style: TextStyles.font16DarkGrey500Weight,
                    // textAlign: TextAlign.start,
                  ),
                  verticalSpace(16),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _query = value;
                      });
                    },
                    style: TextStyles.font14Black400Weight,
                    decoration: InputDecoration(
                      hintText: widget.searchHint,
                      hintStyle: TextStyles.font14Dark300400Weight,
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorsManager.darkGray,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: ColorsManager.dark200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide:
                        BorderSide(color: ColorsManager.primaryColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: ColorsManager.dark200),
                      ),
                    ),
                  ),
                  verticalSpace(16),
                  Expanded(
                    child: ListView.separated(
                      itemCount: _filteredItems.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 4.h),
                      itemBuilder: (context, index) {
                        final item = _filteredItems[index];
                        return RadioListTile<String>(
                          value: item,
                          groupValue: _selected,
                          onChanged: (value) {
                            setState(() {
                              _selected = value;
                            });
                          },
                          title: Text(
                            item,
                            style: TextStyles.font14Black400Weight,
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: ColorsManager.primaryColor,
                          contentPadding: EdgeInsets.zero,
                        );
                      },
                    ),
                  ),
                  verticalSpace(16),
                  MyButton(
                    onPressed: _selected == null ? null : _onSave,
                    height: 48.h,
                    radius: 8.r,
                    backgroundColor: ColorsManager.primaryColor,
                    disabledColor: ColorsManager.dark200,
                    label: 'حفظ',
                    labelStyle: TextStyles.font14White500Weight,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}