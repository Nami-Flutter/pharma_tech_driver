import 'package:pharma_tech_driver/core/helper/socialMediaHelper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/presentation/component/appbars/custom_app_bar.dart';
import 'package:pharma_tech_driver/presentation/modules/auth/login/login.dart';
import 'package:pharma_tech_driver/presentation/modules/setting/widget/delete_account_dialog.dart';
import 'package:pharma_tech_driver/presentation/modules/setting/widget/logout_dialog.dart';
import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/resources.dart';
import '../../../core/routing/route.dart';
import '../../../data/repository/SaveUserData.dart';
import '../../../injection.dart';
import '../../component/animation/list_animator.dart';
import '../../component/buttons/custom_text_button.dart';
import '../../component/svg_icon.dart';
import 'about_app/about_app.dart';
import 'change_language/change_language_sheet.dart';
import 'connect_Us/connect_us.dart';
import 'modify_the_account/modify_the_account.dart';
import 'widget/custom_settind_cared.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  SaveUserData getUserId =getIt();
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.setting.tr(),),
      body: Padding(
            padding:
                EdgeInsets.only( right: 16.w, left: 16.w, bottom: 10.h),
            child: ListAnimator(
              children: [
                const CustomSettingCared(),
                Container(
                    padding: EdgeInsets.all(8.r),
                    // height: 374.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.main10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            LocaleKeys.setting.tr(),
                            style: TextStyles()
                                .getTitleStyle(fontSize: 12.sp)
                                .customColor( AppColors.gray),
                          ),
                        ),
                        // _buildItem(context,
                        //     imageColor:AppColors.primaryColor,
                        //     image: Assets.modifyTheAccount,
                        //     title: tr(LocaleKeys.modifyTheAccount),
                        //     onTap: () {
                        //         push(ModifyTheAccount());
                        //     }),
                        _buildItem(context,
                            imageColor:AppColors.primaryColor,
                            image: Assets.language,
                            title: tr(LocaleKeys.language), onTap: () {
                          showChangeLanguageSheet(context);
                        }),
                        _buildItem(context,
                          imageColor:AppColors.primaryColor,
                            image: Assets.connectUs,
                            title: tr(LocaleKeys.connectUs), onTap: () {push(ConnectUs());}, ),
                        _buildItem(context,
                          imageColor:AppColors.primaryColor,
                            image: Assets.aboutApp,
                            title: tr(LocaleKeys.aboutApp),
                            onTap: () { push(AboutApp());},
                            ),
                        _buildItem(context,
                          imageColor:AppColors.primaryColor,
                            image: Assets.appEvaluation,
                            title: tr(LocaleKeys.appEvaluation),
                            onTap: () {
                          SocialMediaHelper().openStore("com.nami.pharma_tech", "6471109804");
                            },
                            ),
                        // (getUserId.getUserData()?.data?.delegate?.id !=null)? _buildItem(
                        //   context,imageColor:AppColors.errorColor,
                        //   image: Assets.deleteAnAccount,
                        //   title: tr(LocaleKeys.deleteAnAccount),
                        //   onTap: () {
                        //     createAlertDialogDeleteAccount();
                        //   },
                        // ):SizedBox(),
                      ],
                    )),
                CustomTextButton(
                  onPressed: () {
                    (getUserId.getUserData()?.data?.delegate?.id !=null)?createAlertDialogLogout():push(Login());},
                  text: (getUserId.getUserData()?.data?.delegate?.id !=null)?tr(LocaleKeys.logOut):'logingin'.tr(),
                  textColor: AppColors.darkGray,
                  textSize: 14.sp,
                ),
                InkWell(
                  onTap: (){
                    SocialMediaHelper().openLink("https://nami-tec.com");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                      LocaleKeys.developedByACompany.tr(),
                        style: TextStyles()
                            .getRegularStyle(fontSize: 12.sp)
                            .customColor( AppColors.gray),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 5.w,),
                      Text(
                        LocaleKeys.namiSoftware.tr(),
                        style: TextStyles()
                            .getTitleStyle(fontSize: 12.sp)
                            .customColor( AppColors.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
    );
  }

  void createAlertDialogLogout() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const LogoutDialog();
        });
  }
  Future<dynamic> showChangeLanguageSheet(BuildContext context) async {
    return showModalBottomSheet(
      // expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const SafeArea(child: ChangeLanguageSheet()),
    );
  }

  void createAlertDialogDeleteAccount() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const DeleteAccountDialog();
        });
  }

}

_buildItem(BuildContext context,
    {required String image,
    required String title,
    required Color imageColor,
    GestureTapCallback? onTap}) {
  return ListTile(
    onTap: onTap,
    minVerticalPadding: 0,
    contentPadding: const EdgeInsets.all(0),
    trailing: Icon(
      Icons.arrow_forward_ios,
      size: 16.r,
      color:  AppColors.black,
    ),
    title: Text(
      title.tr(),
      style: TextStyles()
          .getRegularStyle()
          .customColor( AppColors.black),
    ),
    leading: SVGIcon(
      image,
      width: 36.w,
      height: 36.h,
      color:imageColor,
    ),
  );
}
