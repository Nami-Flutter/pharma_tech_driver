import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/core/resources/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_colors.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        LocaleKeys.deleteAccount.tr(),
        style: TextStyles()
            .getRegularStyle(fontSize: 16.sp)
            .boldStyle()
            .customColor(AppColors.primaryColor),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
          child: GestureDetector(
              onTap: () {
                // Provider.of<AuthViewModel>(context, listen: false)
                //     .deleteAccount(context);
                // NavigationService.pushNamedAndRemoveUntil(Routes.login);
              },
              child: Text(
                LocaleKeys.confirm.tr(),
                style: TextStyles()
                    .getRegularStyle(fontSize: 16.sp)
                    .boldStyle()
                    .customColor(AppColors.errorColor),
              )),
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
        //   child: !Provider.of<AuthViewModel>(context, listen: true).isLoading
        //       ? GestureDetector(
        //           onTap: () {
        //             Navigator.of(context).pop();
        //           },
        //           child: Text(
        //             LocaleKeys.cancel.tr(),
        //             style: TextStyles()
        //                 .getRegularStyle(fontSize: 16.sp)
        //                 .boldStyle()
        //                 .customColor(AppColors.primaryColor),
        //           ))
        //       : SizedBox(
        //           height: 24.h,
        //           width: 24.w,
        //           child: const CircularProgressIndicator(
        //             strokeWidth: 3,
        //           )),
        // ),
      ],
    );
  }
}
