import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/utils/spacing.dart';
import '../../theme/colors.dart';
import 'empty.dart';
import 'my_svg.dart';

enum ButtonType { primary, secondary, outlined, text, danger, success }

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final Function()? onLongPress;
  final ButtonType buttonType;
  final bool isLoading;
  final bool isDisabled;

  final String? image;
  final bool isImage;
  final String? imageIcon;
  final double? iconHeight;
  final double? iconWidth;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final String? label;
  final TextStyle? labelStyle;

  final Color? textColor;
  final Color? backgroundColor;
  final Color? disabledColor;
  final Color? borderColor;
  final double? radius;
  final double? height;
  final double? minWidth;
  final double stroke;
  final double gap;
  final EdgeInsetsGeometry? padding;
  final double? margin;
  final bool expand;

  final double elevation;
  final Color? splashColor;
  final Color? highlightColor;

  const MyButton({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.buttonType = ButtonType.primary,
    this.isLoading = false,
    this.isDisabled = false,
    this.image,
    this.label,
    this.textColor,
    this.backgroundColor,
    this.disabledColor,
    this.splashColor,
    this.highlightColor,
    this.elevation = 0,
    this.padding,
    this.radius,
    this.minWidth,
    this.height,
    this.stroke = 0,
    this.borderColor,
    this.gap = 8,
    this.labelStyle,
    this.isImage = false,
    this.imageIcon,
    this.iconHeight,
    this.iconWidth,
    this.margin,
    this.prefixIcon,
    this.suffixIcon,
    this.expand = true,
  });

  const MyButton.primary({
    super.key,
    required this.label,
    this.onPressed,
    this.onLongPress,
    this.prefixIcon,
    this.suffixIcon,
    this.isLoading = false,
    this.isDisabled = false,
    this.height,
    this.minWidth,
    this.radius,
    this.padding,
    this.margin,
    this.gap = 8,
    this.labelStyle,
    this.elevation = 0,
    this.expand = true,
  })  : buttonType = ButtonType.primary,
        image = null,
        isImage = false,
        imageIcon = null,
        iconHeight = null,
        iconWidth = null,
        textColor = null,
        backgroundColor = null,
        disabledColor = null,
        borderColor = null,
        stroke = 0,
        splashColor = null,
        highlightColor = null;

  const MyButton.secondary({
    super.key,
    required this.label,
    this.onPressed,
    this.onLongPress,
    this.prefixIcon,
    this.suffixIcon,
    this.isLoading = false,
    this.isDisabled = false,
    this.height,
    this.minWidth,
    this.radius,
    this.padding,
    this.margin,
    this.gap = 8,
    this.labelStyle,
    this.elevation = 0,
    this.expand = true,
  })  : buttonType = ButtonType.secondary,
        image = null,
        isImage = false,
        imageIcon = null,
        iconHeight = null,
        iconWidth = null,
        textColor = null,
        backgroundColor = null,
        disabledColor = null,
        borderColor = null,
        stroke = 0,
        splashColor = null,
        highlightColor = null;

  const MyButton.outlined({
    super.key,
    required this.label,
    this.onPressed,
    this.onLongPress,
    this.prefixIcon,
    this.suffixIcon,
    this.isLoading = false,
    this.isDisabled = false,
    this.height,
    this.minWidth,
    this.radius,
    this.padding,
    this.margin,
    this.gap = 8,
    this.labelStyle,
    this.borderColor,
    this.stroke = 1.5,
    this.expand = true,
  })  : buttonType = ButtonType.outlined,
        image = null,
        isImage = false,
        imageIcon = null,
        iconHeight = null,
        iconWidth = null,
        textColor = null,
        backgroundColor = null,
        disabledColor = null,
        elevation = 0,
        splashColor = null,
        highlightColor = null;

  const MyButton.text({
    super.key,
    required this.label,
    this.onPressed,
    this.onLongPress,
    this.prefixIcon,
    this.suffixIcon,
    this.isLoading = false,
    this.isDisabled = false,
    this.height,
    this.minWidth,
    this.radius,
    this.padding,
    this.margin,
    this.gap = 8,
    this.labelStyle,
    this.textColor,
    this.expand = true,
  })  : buttonType = ButtonType.text,
        image = null,
        isImage = false,
        imageIcon = null,
        iconHeight = null,
        iconWidth = null,
        backgroundColor = null,
        disabledColor = null,
        borderColor = null,
        stroke = 0,
        elevation = 0,
        splashColor = null,
        highlightColor = null;

  const MyButton.danger({
    super.key,
    required this.label,
    this.onPressed,
    this.onLongPress,
    this.prefixIcon,
    this.suffixIcon,
    this.isLoading = false,
    this.isDisabled = false,
    this.height,
    this.minWidth,
    this.radius,
    this.padding,
    this.margin,
    this.gap = 8,
    this.labelStyle,
    this.elevation = 0,
    this.expand = true,
  })  : buttonType = ButtonType.danger,
        image = null,
        isImage = false,
        imageIcon = null,
        iconHeight = null,
        iconWidth = null,
        textColor = null,
        backgroundColor = null,
        disabledColor = null,
        borderColor = null,
        stroke = 0,
        splashColor = null,
        highlightColor = null;

  const MyButton.success({
    super.key,
    required this.label,
    this.onPressed,
    this.onLongPress,
    this.prefixIcon,
    this.suffixIcon,
    this.isLoading = false,
    this.isDisabled = false,
    this.height,
    this.minWidth,
    this.radius,
    this.padding,
    this.margin,
    this.gap = 8,
    this.labelStyle,
    this.elevation = 0,
    this.expand = true,
  })  : buttonType = ButtonType.success,
        image = null,
        isImage = false,
        imageIcon = null,
        iconHeight = null,
        iconWidth = null,
        textColor = null,
        backgroundColor = null,
        disabledColor = null,
        borderColor = null,
        stroke = 0,
        splashColor = null,
        highlightColor = null;

  const MyButton.icon({
    super.key,
    required this.prefixIcon,
    this.label,
    this.onPressed,
    this.onLongPress,
    this.isLoading = false,
    this.isDisabled = false,
    this.height,
    this.minWidth,
    this.radius,
    this.padding,
    this.margin,
    this.gap = 8,
    this.labelStyle,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.stroke = 0,
    this.expand = false,
  })  : buttonType = ButtonType.primary,
        image = null,
        isImage = false,
        imageIcon = null,
        iconHeight = null,
        iconWidth = null,
        suffixIcon = null,
        disabledColor = null,
        elevation = 0,
        splashColor = null,
        highlightColor = null;

  Color _getBackgroundColor(BuildContext context) {
    if (isDisabled) {
      return disabledColor ?? ColorsManager.darkGray300;
    }

    if (backgroundColor != null) return backgroundColor!;

    final theme = Theme.of(context);

    switch (buttonType) {
      case ButtonType.primary:
        return theme.colorScheme.primary;
      case ButtonType.secondary:
        return theme.colorScheme.secondary;
      case ButtonType.outlined:
      case ButtonType.text:
        return ColorsManager.transparent;
      case ButtonType.danger:
        return ColorsManager.errorColor;
      case ButtonType.success:
        return ColorsManager.success500;
    }
  }

  Color _getTextColor(BuildContext context) {
    if (isDisabled) return ColorsManager.white;

    if (textColor != null) return textColor!;

    final theme = Theme.of(context);

    switch (buttonType) {
      case ButtonType.primary:
        return theme.colorScheme.onPrimary;
      case ButtonType.secondary:
        return theme.colorScheme.onSecondary;
      case ButtonType.outlined:
        return theme.colorScheme.primary;
      case ButtonType.text:
        return theme.colorScheme.primary;
      case ButtonType.danger:
        return ColorsManager.white;
      case ButtonType.success:
        return ColorsManager.white;
    }
  }

  Color _getBorderColor(BuildContext context) {
    if (isDisabled) return ColorsManager.transparent;

    if (borderColor != null) return borderColor!;

    final theme = Theme.of(context);

    switch (buttonType) {
      case ButtonType.outlined:
        return theme.colorScheme.primary;
      default:
        return ColorsManager.transparent;
    }
  }

  double _getStroke() {
    switch (buttonType) {
      case ButtonType.outlined:
        return stroke > 0 ? stroke : 1.5;
      default:
        return stroke;
    }
  }

  TextStyle _getLabelStyle(BuildContext context) {
    final theme = Theme.of(context);
    final baseStyle = theme.textTheme.labelLarge ?? const TextStyle();

    return labelStyle ??
        baseStyle.copyWith(
          color: _getTextColor(context),
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        );
  }

  double _getHeight() {
    return height ?? 50.h;
  }

  double _getRadius() {
    return radius ?? 12.r;
  }

  EdgeInsetsGeometry _getPadding() {
    if (padding != null) return padding!;

    if (height != null && height! < 40.h) {
      return EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h);
    }

    return EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h);
  }

  List<Widget> _buildRowChildren(BuildContext context) {
    final List<Widget> children = [];

    if (isLoading) {
      return [
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(_getTextColor(context)),
          ),
        ),
      ];
    }

    final bool hasPrefixContent =
        prefixIcon != null || imageIcon != null || image != null;
    final bool hasSuffixContent = suffixIcon != null;

    if (prefixIcon != null) {
      children.add(prefixIcon!);
    } else if (imageIcon != null) {
      children.add(
        Image.asset(
          'assets/images/$imageIcon.png',
          width: iconWidth ?? 20.w,
          height: iconHeight ?? 20.h,
        ),
      );
    } else if (image != null) {
      children.add(
        MySvg(
          image: image!,
          isImage: isImage,
          height: iconHeight ?? 20.h,
          width: iconWidth ?? 20.w,
        ),
      );
    }

    if (hasPrefixContent && label != null) {
      children.add(horizontalSpace(gap));
    }

    if (label != null) {
      children.add(
        Text(
          label!,
          style: _getLabelStyle(context),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      );
    }

    if (hasSuffixContent && label != null) {
      children.add(horizontalSpace(gap));
    }

    if (suffixIcon != null) {
      children.add(suffixIcon!);
    }

    if (children.isEmpty) {
      children.add(const Empty());
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    final bool isButtonDisabled = isDisabled || isLoading;

    Widget button = MaterialButton(
      onPressed: isButtonDisabled ? null : onPressed,
      onLongPress: isButtonDisabled ? null : onLongPress,
      color: _getBackgroundColor(context),
      disabledColor: disabledColor ?? ColorsManager.darkGray300,
      splashColor: splashColor ?? _getTextColor(context).withOpacity(0.1),
      highlightColor:
      highlightColor ?? _getTextColor(context).withOpacity(0.05),
      elevation: elevation,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      padding: _getPadding(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_getRadius()),
        side: BorderSide(
          color: _getBorderColor(context),
          width: _getStroke(),
        ),
      ),
      height: _getHeight(),
      minWidth: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: _buildRowChildren(context),
      ),
    );

    if (minWidth != null) {
      button = SizedBox(
        height: _getHeight(),
        width: minWidth,
        child: button,
      );
    } else if (expand) {
      button = SizedBox(
        height: _getHeight(),
        width: double.infinity,
        child: button,
      );
    } else {
      button = SizedBox(
        height: _getHeight(),
        child: button,
      );
    }

    if (margin != null && margin! > 0) {
      button = Padding(
        padding: EdgeInsets.symmetric(horizontal: margin!),
        child: button,
      );
    }

    return button;
  }
}