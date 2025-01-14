import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';

import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../core/resources/app_colors.dart';
import '../component.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback _onTap;
  final Widget? _child;
  final String? _title;
  final TextStyle? _textStyle;
  final Color? _color;
  final Color? borderColor;
  final Color? _textColor;
  final double? _width;
  final double? _height;
  final double? _fontSize;
  final bool _isRounded;
  final bool _isOutlined;
  final bool _widerPadding;
  final bool _loading;

  const CustomButton({
    super.key,
    required VoidCallback onTap,
    Widget? child,
    String? title,
    TextStyle? textStyle,
    Color? color,
    Color? textColor,
    double? width,
    double? fontSize,
    double? height,
    bool isRounded = true,
    bool isOutlined = false,
    bool widerPadding = false,
    bool loading = false,
    this.borderColor,
  })  : _onTap = onTap,
        _child = child,
        _title = title,
        _color = color,
        _textColor = textColor,
        _width = width,
        _fontSize = fontSize,
        _height = height,
        _isRounded = isRounded,
        _isOutlined = isOutlined,
        _widerPadding = widerPadding,
        _loading = loading,
        _textStyle = textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width ?? deviceWidth,
      height: (_height ?? 53).h,
      child: TapEffect(
        isClickable: !_loading,
        onClick: _loading ? null : _onTap,
        child: MaterialButton(
          height: _height ?? 53.h,
          color: _isOutlined
              ? Colors.transparent
              : (_color ?? AppColors.primaryColor),
          highlightElevation: 0,
          onPressed: _loading ? () {} : _onTap,
          padding: !_widerPadding
              ? EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w)
              : EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          elevation: 0,
          shape: _isRounded
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kFormRadiusSmall.r),
                  side: BorderSide(
                    color: _color ?? AppColors.primaryColor,
                    width: 1.5.w,
                  ))
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12.r),
                  side: BorderSide(
                    color: borderColor ?? AppColors.primaryColor,
                    width: 1.0.w,
                  ),
                ),
          child: _loading
              ? Padding(
                padding:  EdgeInsets.all(6.r),
                child: LoadingSpinner(
                     color: Theme.of(context).cardColor),
              )
              : _title != null
                  ? Center(
                      child: Text(
                        _title!,
                        style:_textStyle?? TextStyles()
                            .getTitleStyle(fontSize: _fontSize ?? 14)
                            .customColor(_textColor ?? Colors.white),
                      ),
                    )
                  : _child ?? const SizedBox(),
        ),
      ),
    );
  }
}
