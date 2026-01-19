import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/utils/spacing.dart';
import '../../../login/ui/widgets/full_height_scroll_view.dart';
import '../widgets/register_header.dart';
import '../widgets/register_title_section.dart';
import '../widgets/full_name_field.dart';
import '../widgets/register_email_field.dart';
import '../widgets/register_password_field.dart';
import '../widgets/password_rules_section.dart';
import '../widgets/register_primary_button.dart';
import '../widgets/register_footer_section.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onRegister() {
    if (_formKey.currentState?.validate() ?? false) {}
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
                    verticalSpace(32),
                    const RegisterHeader(),
                    verticalSpace(32),
                    const RegisterTitleSection(),
                    verticalSpace(32),
                    FullNameField(controller: _fullNameController),
                    verticalSpace(16),
                    RegisterEmailField(controller: _emailController),
                    verticalSpace(16),
                    RegisterPasswordField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      onToggleObscure: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    verticalSpace(32),
                    RegisterPrimaryButton(onPressed: _onRegister),
                    verticalSpace(32),
                    const RegisterFooterSection(),
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