import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

enum FieldType { text, email, password, phone, number, search, multiline, otp }

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final FieldType fieldType;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final int? maxLength;
  final int maxLines;
  final int? minLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final String? suffixText;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final bool filled;
  final Color? fillColor;
  final double? borderRadius;
  final int otpLength;
  final ValueChanged<String>? onOtpCompleted;

  const MyTextField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.fieldType = FieldType.text,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.suffixText,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.inputFormatters,
    this.focusNode,
    this.contentPadding,
    this.filled = false,
    this.fillColor,
    this.borderRadius,
    this.otpLength = 6,
    this.onOtpCompleted,
  });

  const MyTextField.email({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.focusNode,
    this.contentPadding,
    this.filled = false,
    this.fillColor,
    this.borderRadius,
  })  : fieldType = FieldType.email,
        maxLength = null,
        maxLines = 1,
        minLines = null,
        prefixText = null,
        suffixText = null,
        inputFormatters = null,
        otpLength = 6,
        onOtpCompleted = null;

  const MyTextField.password({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.prefixIcon,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.focusNode,
    this.contentPadding,
    this.filled = false,
    this.fillColor,
    this.borderRadius,
  })  : fieldType = FieldType.password,
        maxLength = null,
        maxLines = 1,
        minLines = null,
        suffixIcon = null,
        prefixText = null,
        suffixText = null,
        inputFormatters = null,
        otpLength = 6,
        onOtpCompleted = null;

  const MyTextField.phone({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.focusNode,
    this.contentPadding,
    this.filled = false,
    this.fillColor,
    this.borderRadius,
    this.maxLength = 15,
  })  : fieldType = FieldType.phone,
        maxLines = 1,
        minLines = null,
        suffixText = null,
        inputFormatters = null,
        otpLength = 6,
        onOtpCompleted = null;

  const MyTextField.number({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.suffixText,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.focusNode,
    this.contentPadding,
    this.filled = false,
    this.fillColor,
    this.borderRadius,
    this.maxLength,
  })  : fieldType = FieldType.number,
        maxLines = 1,
        minLines = null,
        inputFormatters = null,
        otpLength = 6,
        onOtpCompleted = null;

  const MyTextField.search({
    super.key,
    this.controller,
    this.hintText,
    this.enabled = true,
    this.autofocus = false,
    this.suffixIcon,
    this.textInputAction = TextInputAction.search,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon,
    this.onTap,
    this.focusNode,
    this.contentPadding,
    this.fillColor,
    this.borderRadius,
  })  : fieldType = FieldType.search,
        label = null,
        helperText = null,
        errorText = null,
        readOnly = false,
        maxLength = null,
        maxLines = 1,
        minLines = null,
        // prefixIcon = null,
        prefixText = null,
        suffixText = null,
        validator = null,
        inputFormatters = null,
        filled = true,
        otpLength = 6,
        onOtpCompleted = null;

  const MyTextField.multiline({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLength,
    this.maxLines = 5,
    this.minLines = 3,
    this.textInputAction = TextInputAction.newline,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.focusNode,
    this.contentPadding,
    this.filled = false,
    this.fillColor,
    this.borderRadius,
  })  : fieldType = FieldType.multiline,
        prefixIcon = null,
        suffixIcon = null,
        prefixText = null,
        suffixText = null,
        inputFormatters = null,
        otpLength = 6,
        onOtpCompleted = null;

  const MyTextField.otp({
    super.key,
    this.label,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.autofocus = true,
    required this.onChanged,
    this.onOtpCompleted,
    this.otpLength = 6,
    this.fillColor,
    this.borderRadius,
  })  : fieldType = FieldType.otp,
        controller = null,
        hintText = null,
        readOnly = false,
        maxLength = null,
        maxLines = 1,
        minLines = null,
        prefixIcon = null,
        suffixIcon = null,
        prefixText = null,
        suffixText = null,
        textInputAction = null,
        onSubmitted = null,
        onTap = null,
        validator = null,
        inputFormatters = null,
        focusNode = null,
        contentPadding = null,
        filled = true;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscureText = true;
  late FocusNode _focusNode;
  bool _isFocused = false;

  List<TextEditingController>? _otpControllers;
  List<FocusNode>? _otpFocusNodes;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);

    if (widget.fieldType == FieldType.otp) {
      _initOtpFields();
    }
  }

  void _initOtpFields() {
    _otpControllers = List.generate(widget.otpLength, (_) => TextEditingController());
    _otpFocusNodes = List.generate(widget.otpLength, (_) => FocusNode());

    if (widget.autofocus && _otpFocusNodes!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _otpFocusNodes![0].requestFocus();
      });
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }

    if (_otpControllers != null) {
      for (final c in _otpControllers!) {
        c.dispose();
      }
    }
    if (_otpFocusNodes != null) {
      for (final f in _otpFocusNodes!) {
        f.dispose();
      }
    }

    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _handleOtpChange(String value, int index) {
    if (value.length > 1) {
      _otpControllers![index].text = value.substring(value.length - 1);
    }

    if (value.isNotEmpty) {
      if (index < widget.otpLength - 1) {
        _otpFocusNodes![index + 1].requestFocus();
      } else {
        _otpFocusNodes![index].unfocus();
      }
    }

    final code = _otpControllers!.map((c) => c.text).join();
    widget.onChanged?.call(code);

    if (code.length == widget.otpLength) {
      widget.onOtpCompleted?.call(code);
    }
  }

  void _handleOtpKeyEvent(KeyEvent event, int index) {
    if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace) {
      if (_otpControllers![index].text.isEmpty && index > 0) {
        _otpFocusNodes![index - 1].requestFocus();
        _otpControllers![index - 1].clear();
      }
    }
  }

  void _handleOtpPaste(String pastedText) {
    final digits = pastedText.replaceAll(RegExp(r'[^0-9]'), '');
    for (int i = 0; i < digits.length && i < widget.otpLength; i++) {
      _otpControllers![i].text = digits[i];
    }

    final lastIndex = (digits.length - 1).clamp(0, widget.otpLength - 1);
    if (digits.length >= widget.otpLength) {
      _otpFocusNodes![lastIndex].unfocus();
    } else {
      _otpFocusNodes![lastIndex].requestFocus();
    }

    final code = _otpControllers!.map((c) => c.text).join();
    widget.onChanged?.call(code);

    if (code.length == widget.otpLength) {
      widget.onOtpCompleted?.call(code);
    }
  }

  TextInputType get _keyboardType {
    switch (widget.fieldType) {
      case FieldType.email:
        return TextInputType.emailAddress;
      case FieldType.password:
        return TextInputType.visiblePassword;
      case FieldType.phone:
        return TextInputType.phone;
      case FieldType.number:
      case FieldType.otp:
        return TextInputType.number;
      case FieldType.multiline:
        return TextInputType.multiline;
      case FieldType.search:
      case FieldType.text:
        return TextInputType.text;
    }
  }

  Widget? _buildPrefixIcon(ThemeData theme) {
    if (widget.prefixIcon != null) return widget.prefixIcon;

    IconData? iconData;
    switch (widget.fieldType) {
      case FieldType.email:
        iconData = Icons.email_outlined;
        break;
      case FieldType.password:
        iconData = Icons.lock_outline;
        break;
      case FieldType.phone:
        iconData = Icons.phone_outlined;
        break;
      case FieldType.search:
        iconData = Icons.search;
        break;
      default:
        return null;
    }

    return Icon(
      iconData,
      color: _isFocused ? theme.colorScheme.primary : theme.inputDecorationTheme.hintStyle?.color,
      size: 22.sp,
    );
  }

  Widget? _buildSuffixIcon(ThemeData theme) {
    if (widget.fieldType == FieldType.password) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: theme.inputDecorationTheme.hintStyle?.color,
          size: 22.sp,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    }

    if (widget.fieldType == FieldType.search &&
        widget.controller != null &&
        widget.controller!.text.isNotEmpty) {
      return IconButton(
        icon: Icon(
          Icons.clear,
          color: theme.inputDecorationTheme.hintStyle?.color,
          size: 20.sp,
        ),
        onPressed: () {
          widget.controller!.clear();
          widget.onChanged?.call('');
        },
      );
    }

    return widget.suffixIcon;
  }

  List<TextInputFormatter>? get _inputFormatters {
    if (widget.inputFormatters != null) return widget.inputFormatters;

    switch (widget.fieldType) {
      case FieldType.phone:
      case FieldType.otp:
        return [FilteringTextInputFormatter.digitsOnly];
      case FieldType.number:
        return [FilteringTextInputFormatter.allow(RegExp(r'[\d.]'))];
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (widget.fieldType == FieldType.otp) {
      return _buildOtpField(theme);
    }

    return _buildRegularField(theme);
  }

  Widget _buildOtpField(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: theme.textTheme.titleSmall?.copyWith(
              color: ColorsManager.dark500,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12.h),
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(widget.otpLength, (index) {
            final hasValue = _otpControllers![index].text.isNotEmpty;
            final isFocused = _otpFocusNodes![index].hasFocus;
            final hasError = widget.errorText != null;

            return SizedBox(
              width: 48.w,
              height: 56.h,
              child: KeyboardListener(
                focusNode: FocusNode(),
                onKeyEvent: (event) => _handleOtpKeyEvent(event, index),
                child: TextField(
                  controller: _otpControllers![index],
                  focusNode: _otpFocusNodes![index],
                  enabled: widget.enabled,
                  textAlign: TextAlign.center,
                  style: TextStyles.font16DarkGrey400Weight.copyWith(
                    color: hasError ? theme.colorScheme.error : ColorsManager.dark500,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    counterText: '',
                    filled: widget.filled,
                    fillColor: widget.fillColor ?? (hasValue ? ColorsManager.primary50 : Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
                      borderSide: BorderSide(
                        color: hasError
                            ? theme.colorScheme.error
                            : hasValue
                            ? ColorsManager.primaryColor
                            : ColorsManager.dark200,
                        width: hasValue ? 1.5 : 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
                      borderSide: BorderSide(
                        color: hasError ? theme.colorScheme.error : ColorsManager.primaryColor,
                        width: 2,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
                      borderSide: BorderSide(color: ColorsManager.grey200),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
                      borderSide: BorderSide(color: theme.colorScheme.error, width: 1.5),
                    ),
                  ),
                  onChanged: (value) => _handleOtpChange(value, index),
                  onTap: () {
                    _otpControllers![index].selection = TextSelection.fromPosition(
                      TextPosition(offset: _otpControllers![index].text.length),
                    );
                  },
                ),
              ),
            );
          }),
        ),
        if (widget.errorText != null) ...[
          SizedBox(height: 8.h),
          Text(
            widget.errorText!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.error,
            ),
          ),
        ],
        if (widget.helperText != null && widget.errorText == null) ...[
          SizedBox(height: 8.h),
          Text(
            widget.helperText!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: ColorsManager.dark300,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildRegularField(ThemeData theme) {
    final inputTheme = theme.inputDecorationTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: theme.textTheme.titleSmall?.copyWith(
              color: ColorsManager.dark500,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
        ],
        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          autofocus: widget.autofocus,
          obscureText: widget.fieldType == FieldType.password && _obscureText,
          keyboardType: _keyboardType,
          textInputAction: widget.textInputAction,
          maxLength: widget.maxLength,
          maxLines: widget.fieldType == FieldType.password ? 1 : widget.maxLines,
          minLines: widget.minLines,
          inputFormatters: _inputFormatters,
          style: theme.textTheme.bodyMedium,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          onTap: widget.onTap,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hintText,
            helperText: widget.helperText,
            errorText: widget.errorText,
            prefixIcon: _buildPrefixIcon(theme),
            suffixIcon: _buildSuffixIcon(theme),
            prefixText: widget.prefixText,
            suffixText: widget.suffixText,
            filled: widget.filled,
            fillColor: widget.fillColor ?? inputTheme.fillColor,
            contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            enabledBorder: _buildBorder(inputTheme.enabledBorder, ColorsManager.dark200),
            focusedBorder: _buildBorder(inputTheme.focusedBorder, theme.colorScheme.primary),
            errorBorder: _buildBorder(inputTheme.errorBorder, theme.colorScheme.error),
            focusedErrorBorder: _buildBorder(inputTheme.focusedErrorBorder, theme.colorScheme.error),
            disabledBorder: _buildBorder(inputTheme.disabledBorder, ColorsManager.grey200),
          ),
        ),
      ],
    );
  }

  InputBorder? _buildBorder(InputBorder? themeBorder, Color fallbackColor) {
    if (widget.borderRadius == null) return themeBorder;

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius!),
      borderSide: BorderSide(
        color: themeBorder is OutlineInputBorder ? themeBorder.borderSide.color : fallbackColor,
        width: themeBorder is OutlineInputBorder ? themeBorder.borderSide.width : 1,
      ),
    );
  }
}