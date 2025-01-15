import 'package:easy_localization/easy_localization.dart'as local;
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/core/resources/app_colors.dart';
import 'package:pharma_tech_driver/presentation/modules/auth/login/provider/login_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/logger.dart';
import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/locale_keys.g.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/routing/route.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../../../injection.dart';
import '../../../component/component.dart';
import '../../../component/svg_icon.dart';
import '../../splash/splash.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginLogoutViewModel provider = getIt();

  SaveUserData saveUserData = getIt();
  final tag = 'ChangeLanguageSheet';
  late Locale locale = context.locale;

  bool isSwitch = true;
  @override
  void initState() {
    super.initState();
    provider.initLogin();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isSwitch = (context.locale.languageCode == 'en') ? true : false;
    });
  }
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return CustomScaffold(
      appBar:CustomAppBar(height: 0.h),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.r),bottomRight: Radius.circular(16.r),
            )),
            height: 56.h,
            width:MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 8.w,bottom: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SVGIcon( Assets.logoWithTitle,
                    width: 101.84.w,
                    height: 32.h,),
                  Row(
                    children: [
                      Switch(
                          activeColor: Colors.transparent,
                          activeTrackColor: AppColors.grayTextField,
                          activeThumbImage: const AssetImage(Assets.languagePng), // Custom thumb when active
                          inactiveThumbImage: const AssetImage(Assets.languagePng),
                          value:isSwitch,
                          onChanged: (value){
                            isSwitch = !isSwitch;
                            setState(() {
                              if(isSwitch==true){
                                locale=const Locale('en');
                              }else{
                                locale=const Locale('ar');
                              }
                            });
                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                              log('onLanguageSelected', 'change language to (${locale.languageCode})');
                              saveUserData.saveLang(locale.languageCode);
                              if (saveUserData.getUserData()?.data?.delegate?.id !=null) {
                                WidgetsBinding.instance.addPostFrameCallback((timeStamp){
                                    provider.updateFCMToken();
                                });
                              }
                              context.setLocale(locale);
                              pushAndRemoveUntil(Splash());
                            });
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  right: AppSize.s16.w, left: AppSize.s16.w, bottom: AppSize.s8.h),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ListAnimator(
                    children: [
                      VerticalSpace(AppSize.s4.h),
                      SVGIcon(
                        Assets.logIn,
                        height: 160.h,
                        width: 104.36.w
                      ),
                      VerticalSpace(AppSize.s8.h),
                      Text(
                         local.tr(LocaleKeys.tittleLogin),
                        style: const TextStyle()
                            .titleStyle(fontSize: FontSize.s28.sp)
                            .customColor(AppColors.gray),
                      ),
                      Text(
                         local.tr(LocaleKeys.bodyLogin),
                        style: const TextStyle()
                            .bodyStyle(fontSize: FontSize.s14.sp)
                            .customColor(AppColors.gray),
                      ),
                      VerticalSpace(AppSize.s8.h),
                      Row(children: [
                        SVGIcon(Assets.phoneIcon,color: AppColors.primaryColor,width: 20.w,height: 20.h),
                        SizedBox(width: 5.w),
                        Text(
                           local.tr(LocaleKeys.phoneNumber),
                          style: const TextStyle()
                              .regularStyle(fontSize: FontSize.s14.sp)
                              .customColor(AppColors.black),
                        ),
                      ],),
                      _buildForm(),
                      VerticalSpace(AppSize.s4.h),
                      CustomButton(
                        onTap: () {
                          provider.onSubmit(context);
                        },
                        title:  local.tr(LocaleKeys.login),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (!isKeyboard)
            Align(
              alignment: Alignment.bottomLeft,
              child: SVGIcon(
                Assets.bottomLogin,
                width: AppSize.s99.w,
                height: AppSize.s87.h,
              ),
            )
        ],
      ),
    );
  }

  _buildForm() {
    return Form(
      key: provider.formKey,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextFieldPhone(
                  validationMSG: provider.validationMSG,
                  hint: '0XXXXXXXX',
                  hintStyle: TextStyles().getRegularStyle(fontSize: 12.sp).customColor(AppColors.gray),
                  controller: provider.phoneController,
                  hintTextDirection: TextDirection.ltr,
                  background:AppColors.grayLight,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(children: [
            SVGIcon(Assets.password,color: AppColors.primaryColor,width: 20.w,height: 20.h),
            SizedBox(width: 5.w),
            Text(local.tr(LocaleKeys.password),
              style: const TextStyle()
                  .regularStyle(fontSize: FontSize.s14.sp)
                  .customColor(AppColors.black),
            ),
          ],),
          SizedBox(height: 10.h),
          CustomTextFieldPassword(
            validationMSG: provider.validationMSG,
            controller: provider.passwordController,
            hint: LocaleKeys.enterYourPassword.tr(),background:AppColors.grayLight,
            hintStyle: TextStyles().getRegularStyle(fontSize: 12.sp).customColor(AppColors.gray),)
        ],
      ),
    );
  }
}
