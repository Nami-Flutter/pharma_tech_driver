import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/core/resources/locale_keys.g.dart';
import 'package:pharma_tech_driver/presentation/modules/auth/login/provider/login_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_colors.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        LocaleKeys.logOutDialog.tr(),
        style: TextStyles()
            .getRegularStyle(fontSize: 16.sp)
            .boldStyle()
            .customColor(AppColors.primaryColor),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
          child: !Provider.of<LoginLogoutViewModel>(context, listen: true).isLoading
              ? GestureDetector(
                  onTap: () {
                    Provider.of<LoginLogoutViewModel>(context, listen: false).logout();
                  },
                  child: Text(
                    LocaleKeys.confirm.tr(),
                    style: TextStyles()
                        .getRegularStyle(fontSize: 16.sp)
                        .boldStyle()
                        .customColor(AppColors.errorColor),
                  ))
              : SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                  )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                LocaleKeys.cancel.tr(),
                style: TextStyles()
                    .getRegularStyle(fontSize: 16.sp)
                    .boldStyle()
                    .customColor(AppColors.primaryColor),
              )),
        ),
      ],
    );
  }
}
