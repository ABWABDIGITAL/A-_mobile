
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/utils/spacing.dart';
import '../../../login/ui/widgets/full_height_scroll_view.dart';
import '../../../verification/ui/screens/verification_screen.dart';
import '../widgets/forgot_header.dart';
import '../widgets/forgot_title_section.dart';
import '../widgets/forgot_email_field.dart';
import '../widgets/forgot_primary_button.dart';
import '../widgets/forgot_footer_section.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSendCode() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: FullHeightScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    verticalSpace(20),
                    const ForgotHeader(),
                    verticalSpace(32),
                    const ForgotTitleSection(),
                    verticalSpace(32),
                    ForgotEmailField(controller: _emailController),
                    verticalSpace(32),
                    ForgotPrimaryButton(onPressed: _onSendCode),
                    verticalSpace(32),
                    const ForgotFooterSection(),
                    verticalSpace(24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}