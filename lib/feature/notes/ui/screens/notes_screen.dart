// feature/notes/ui/screens/notes_screen.dart
import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/primary/my_svg.dart';
import '../../../../core/widgets/primary/primary_back_icon.dart';
import '../widgets/add_note_bottom_sheet.dart';
import '../widgets/notes_floating_add_button.dart';
import '../widgets/notes_header.dart';
import '../widgets/notes_list.dart';
import '../widgets/notes_search_field.dart';
import '../widgets/notes_section_header.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<NoteItemData> _notes = const [
    NoteItemData(
      titleKey: 'notes.note1_title',
      descKey: 'notes.note1_desc',
      timeKey: 'notes.note1_time',
    ),
    NoteItemData(
      titleKey: 'notes.note2_title',
      descKey: 'notes.note2_desc',
      timeKey: 'notes.note2_time',
    ),
    NoteItemData(
      titleKey: 'notes.note3_title',
      descKey: 'notes.note3_desc',
      timeKey: 'notes.note3_time',
    ),
    NoteItemData(
      titleKey: 'notes.note4_title',
      descKey: 'notes.note4_desc',
      timeKey: 'notes.note4_time',
    ),
    NoteItemData(
      titleKey: 'notes.note5_title',
      descKey: 'notes.note5_desc',
      timeKey: 'notes.note5_time',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<NoteItemData> get _visibleNotes {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) return _notes;

    return _notes.where((n) {
      final title = n.titleKey.tr().toLowerCase();
      final desc = n.descKey.tr().toLowerCase();
      return title.contains(query) || desc.contains(query);
    }).toList();
  }

  void _showAddNoteSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const AddNoteBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    final direction = isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr;

    return Directionality(
      textDirection: direction,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const NotesHeader(),
                verticalSpace(16),
                const NotesSectionHeader(),
                verticalSpace(12),
                NotesSearchField(controller: _searchController),
                verticalSpace(12),
                Expanded(
                  child: NotesList(notes: _visibleNotes),
                ),
                verticalSpace(8),
                NotesFloatingAddButton(onPressed: _showAddNoteSheet),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoteItemData {
  final String titleKey;
  final String descKey;
  final String timeKey;

  const NoteItemData({
    required this.titleKey,
    required this.descKey,
    required this.timeKey,
  });
}