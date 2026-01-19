import 'package:a_plus/feature/create_profile/ui/screens/create_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/utils/spacing.dart';

import '../widgets/Login_header.dart';
import '../widgets/create_Acount_section.dart';
import '../widgets/email_field.dart';
import '../widgets/full_height_scroll_view.dart';
import '../widgets/login_primary_button.dart';
import '../widgets/login_title_section.dart';
import '../widgets/password_field.dart';
import '../widgets/remember_forgot_row.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateProfileScreen()));
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
                    verticalSpace(32),
                    const LoginHeader(),
                    verticalSpace(32),
                    const LoginTitleSection(),
                    verticalSpace(32),
                    EmailField(controller: _emailController),
                    verticalSpace(16),
                    PasswordField(
                      controller: _passwordController,
                    ),
                    verticalSpace(12),
                    RememberForgotRow(
                      value: _rememberMe,
                      onChanged: (v) {
                        setState(() {
                          _rememberMe = v ?? false;
                        });
                      },
                    ),
                    verticalSpace(32),
                    LoginPrimaryButton(onPressed: _onLogin),
                    verticalSpace(32),
                    const CreateAccountSection(),

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