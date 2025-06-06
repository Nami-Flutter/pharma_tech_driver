import 'package:pharma_tech_driver/core/res/text_styles.dart';
import 'package:pharma_tech_driver/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:easy_localization/easy_localization.dart' as el;

import '../../../core/resources/locale_keys.g.dart';
import 'base_form.dart';

class CustomTextFieldNormal extends StatelessWidget {
  final String? suffixText;
  final String? hint;
  final String? defaultValue;
  final String? label;
  final String? iconSVG;
  final TextInputType? type;

  final bool readOnly;
  final bool isHorizontal;
  final bool autoValidate;
  final bool noBorder;
  final bool isRequired;
  final bool autofocus;
  final bool enable;
  final String? validationMSG;

  final int? lines;
  final int? maxLength;

  final double? fontSize;
  final double? radius;
  final double? contentPaddingH;

  final List<TextInputFormatter>? formatter;

  final Widget? icon;
  final Widget? suffixData;

  final IconData? iconData;
  final IconData? suffixIconData;

  final Color? background;

  final VoidCallback? onTap;
  final ValueChanged<String>? onChange;
  final Function? validateFunc;
  final Function? onSubmit;

  final TextEditingController? controller;
  final TextInputAction? textInputAction;

   const CustomTextFieldNormal({
    Key? key,
    this.suffixText,
    this.hint,
    this.defaultValue,
    this.label,
    this.iconSVG,
    this.isHorizontal = false,
    this.autoValidate = false,
    this.readOnly = false,
    this.noBorder = false,
    this.isRequired = true,
    this.autofocus = false,
    this.enable = true,
    this.lines,
    this.maxLength,
    this.fontSize,
    this.radius,
    this.contentPaddingH,
    this.formatter,
    this.icon,
    this.suffixData,
    this.iconData,
    this.suffixIconData,
    this.background,
    this.onTap,
    this.onChange,
    this.validateFunc,
    this.onSubmit,
    this.controller,
    this.textInputAction,
     this.type, this.validationMSG,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      background: background,
      icon: icon,
      prefixIcon: iconData,
      isHorizontal: isHorizontal,
      defaultValue: defaultValue,
      prefixWidget:iconSVG==null?null: SizedBox(height: 24.h,width: 24.w,child: Center(child: SvgPicture.asset(iconSVG!,height: 24.h,width: 24.w,color: AppColors.primaryColor,))),

      hint: hint,
      onTap: onTap,
      maxLength: maxLength,
      readOnly: readOnly,
      autoValidate: autoValidate,
      enable: enable,
      noBorder: noBorder,
      isRequired: isRequired,
      label: label,
      contentPaddingH: contentPaddingH,
      lines: lines,
      fontSize: fontSize,
      radius: radius,
      onChange: onChange,
      suffixIconData: suffixIconData,
      validateFunc: validateFunc ??
              (value) {
            if ((value ?? '').length != 9) {
              return el.tr(validationMSG??LocaleKeys.msgInvalidPhoneNumber);
            }
            if (validateFunc != null) return validateFunc!(value);
            return null;
          },
      suffixText: suffixText,
      formatter: formatter,
      type: type ?? TextInputType.text,
      controller: controller ?? TextEditingController(),
      suffixData: suffixData,
      onSubmit: onSubmit,
      autofocus: autofocus,
      textInputAction: textInputAction,
      hintStyle: TextStyles().getRegularStyle(fontSize: 12.sp).customColor(AppColors.gray),
    );
  }
}
