import 'package:a_plus/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/utils/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

import '../../../../core/widgets/primary/app_logo_header.dart';
import '../../../../core/widgets/primary/my_button.dart';
import '../../../../core/widgets/primary/selection_bottom_sheet.dart';
import '../../../../core/widgets/primary/selection_field.dart';
import 'confirm_university_screen.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  String? _selectedUniversity;
  String? _selectedMajor;

  final List<String> _universities = const [
    'جامعة الملك فهد',
    'جامعة الملك سعود',
    'جامعة أم القرى',
    'جامعة الإمام محمد بن سعود',
    'جامعة الملك فيصل',
    'جامعة جازان',
    'جامعة القصيم',
    'جامعة تبوك',
    'جامعة طيبة',
    'جامعة حائل',
  ];

  final List<String> _majors = const [
    'هندسة معماري',
    'إدارة المشاريع',
    'هندسة الاتصالات',
    'الأمن السيبراني',
    'هندسة الحاسب',
    'علم البيانات',
    'هندسة الشبكات',
    'الذكاء الاصطناعي',
    'التسويق الإلكتروني',
    'إدارة الموارد البشرية',
  ];

  Future<void> _pickUniversity() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SelectionBottomSheet(
          title: 'الجامعات المتاحة',
          subtitle: 'حدد الجامعة التي تدرس بها',
          searchHint: 'البحث في الجامعات',
          items: _universities,
          initialValue: _selectedUniversity,
        );
      },
    );
    if (result != null) {
      setState(() {
        _selectedUniversity = result;
      });
    }
  }

  Future<void> _pickMajor() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SelectionBottomSheet(
          title: 'التخصصات المتاحة',
          subtitle: 'اختر تخصصك',
          searchHint: 'البحث في التخصصات',
          items: _majors,
          initialValue: _selectedMajor,
        );
      },
    );
    if (result != null) {
      setState(() {
        _selectedMajor = result;
      });
    }
  }

  void _onContinue() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmUniversityScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                verticalSpace(32),
                const AppLogoHeader(),
                verticalSpace(32),
                Text(
                  'قم بإنشاء ملف التعريف الخاص بك',
                  style: context.headlineLarge,
                  textAlign: TextAlign.start,
                ),
                verticalSpace(8),
                Text(
                  'أخبرنا قليلًا عن نفسك',
                  style: context.bodyMedium,
                ),
                verticalSpace(32),
                SelectionField(
                  hint: 'الجامعة',
                  value: _selectedUniversity,
                  onTap: _pickUniversity,
                ),
                verticalSpace(16),
                SelectionField(
                  hint: 'التخصص',
                  value: _selectedMajor,
                  onTap: _pickMajor,
                ),
                const Spacer(),
                MyButton(
                  onPressed: _onContinue,
                  height: 52.h,
                  backgroundColor: ColorsManager.primaryColor,
                  label: 'متابعة',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}