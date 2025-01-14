import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/presentation/component/component.dart';
import 'package:provider/provider.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../core/app_loader.dart';
import '../../../../core/res/text_styles.dart';

import '../../../component/svg_icon.dart';
import '../settingViewModel.dart';

class AboutApp extends StatefulWidget {
  AboutApp({Key? key}) : super(key: key);

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  Future<void> _loadData(BuildContext context) async {
    await Provider.of<SettingViewModel>(context, listen: false).setting(context);}
  @override
  void initState() {
    _loadData(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.aboutApp.tr(),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 32.h),
          child: ListAnimator(
            children: [
              SVGIcon(
                Assets.logIn,
                height: 120.h,
                width: 106.84.w,
              ),
              VerticalSpace(32.h),
              Row(
                children: [
                  SVGIcon(
                    Assets.whoAre,
                      color: AppColors.primaryColor,
                      width: 13.w,
                      height: 33.h,

                  ),
                  HorizontalSpace(8.w),
                  Text(
                    LocaleKeys.whoAre.tr(),
                    style: const TextStyle()
                        .titleStyle(fontSize: 18.sp)
                        .customColor(AppColors.black),
                  ),
                ],
              ),
              VerticalSpace(24.h),
              Consumer<SettingViewModel>(builder: (context, data, child) {
                return data.settingModel?.data != null  ?
                Text(
                  data.settingModel?.data?.aboutUs??'',
                  maxLines: null,
                  style:
                  const TextStyle().bodyStyle().customColor(AppColors.gray),
                ):const AppLoader();})

            ],
          ),
        ));
  }
}
