
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/core/res/text_styles.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../../../core/resources/app_colors.dart';

ProgressDialog createProgressDialog(
    {required BuildContext context, required String msg}) {
  String lang = context.locale.languageCode;
  msg = msg.replaceAll('.', '');
  msg = lang=='ar'? '.... $msg':'$msg ....';
  var dialog = ProgressDialog(context, isDismissible: false,);

  dialog.style(
    backgroundColor: AppColors.white,
    message: msg,
    messageTextStyle: TextStyles().getRegularStyle(fontSize: 14.sp).customColor(AppColors.black),
    textAlign: lang=='ar'?TextAlign.end:TextAlign.start,
    progressWidget: Container(
        padding:  EdgeInsets.all(12.r),
        child:  CircularProgressIndicator(strokeWidth: 2.w,color: AppColors.primaryColor,)),
      borderRadius: 4,
      );
  return dialog;
}
