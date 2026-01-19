import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/utils/spacing.dart';
import '../../../login/ui/widgets/full_height_scroll_view.dart';
import '../widgets/verification_header.dart';
import '../widgets/verification_title_section.dart';
import '../widgets/otp_code_fields.dart';
import '../widgets/verification_primary_button.dart';
import '../widgets/verification_footer_section.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String _code = '';

  void _onCodeChanged(String value) {
    setState(() {
      _code = value;
    });
  }

  void _onVerify() {
    if (_code.length == 6) {}
  }

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = _code.length == 6;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: FullHeightScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const VerificationHeader(),
                  verticalSpace(32),
                  const VerificationTitleSection(),
                  verticalSpace(32),
                  OtpCodeFields(
                    length: 6,
                    onChanged: _onCodeChanged,
                  ),
                  verticalSpace(24),
                  VerificationPrimaryButton(
                    enabled: isEnabled,
                    onPressed: isEnabled ? _onVerify : null,
                  ),
                  verticalSpace(24),
                  const VerificationFooterSection(),
                  verticalSpace(24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}