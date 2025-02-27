import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/main.dart';
import 'package:pharma_tech_driver/presentation/component/component.dart';
import 'package:pharma_tech_driver/presentation/modules/setting/update_profile/update_profile_view_model.dart';
import 'package:pharma_tech_driver/presentation/modules/setting/update_profile/widgets/updateProfile_image.dart';
import 'package:provider/provider.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../core/res/text_styles.dart';
import '../../../component/animation/list_animator.dart';
import '../../../component/appbars/custom_app_bar.dart';
import '../../../component/custom_scaffold.dart';
import '../../../component/svg_icon.dart';

class ModifyTheAccount extends StatefulWidget {
  ModifyTheAccount({Key? key}) : super(key: key);

  @override
  State<ModifyTheAccount> createState() => _ModifyTheAccountState();
}

class _ModifyTheAccountState extends State<ModifyTheAccount> {

  final provider = Provider.of<UpdateProfileViewModel>(navigator.currentContext!, listen: false);
@override
  void initState() {
    super.initState();
    provider.initUpdateProfile();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.modifyTheAccount.tr(),
          titleColor: AppColors.black,
        ),
        body: Consumer<UpdateProfileViewModel>(
          builder: (context,data,_) {
            return Padding(
              padding:
                  EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h, bottom: 33.h),
              child: Column(
                children: [
                  Expanded(
                    child: ListAnimator(
                      children: [
                        UpdateProfileImage(),
                        VerticalSpace(32.h),
                        CustomTextFieldNormal(
                          validationMSG:data.validationMSG,
                          defaultValue:
                          provider.saveUserData.getUserData()?.data?.delegate?.name,
                          label: LocaleKeys.name.tr(),
                          controller: data.nameController,
                        ),
                        VerticalSpace(10.h),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 247.w,
                              child: CustomTextFieldPhone(
                                validationMSG:data.validationMSG,
                                hint: '0XXXXXXXX',
                                label: LocaleKeys.phoneNumber.tr(),
                                defaultValue:provider.saveUserData.getUserData()?.data?.delegate?.phone,
                                hintStyle: TextStyles().getRegularStyle(fontSize: 12.sp).customColor(AppColors.gray),
                                suffixData:Text('+218',style:
                                TextStyles().getRegularStyle(fontSize: 12.sp).customColor(AppColors.black)) ,
                                controller: provider.phoneController,
                                readOnly: true,
                                // hintTextDirection: TextDirection.ltr,
                                background:AppColors.grayLight,
                              ),
                            ),
                            Container(
                              // margin: EdgeInsets.only(bottom:(_phoneController.text.isEmpty||_phoneController.text.length<7)? 25.h: 0.h),
                              padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.lightGray,width: 1.w),
                                borderRadius: BorderRadius.circular(12.r),
                                color: AppColors.grayLight,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 16.r,
                                  ),
                                  HorizontalSpace(4.w),
                                  SVGIcon(
                                    provider.phoneCode == '+218'
                                        ?Assets.libiaFlag:
                                    Assets.flag,
                                    width: 48.w,
                                    height: 32.h,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        VerticalSpace(10.h),
                        CustomTextFieldNormal(
                          validationMSG:data.validationMSG,
                          defaultValue:'********',
                          label: LocaleKeys.password.tr(),
                          controller: data.passwordController,
                        ),
                        VerticalSpace(10.h),
                        CustomTextFieldNormal(
                          validationMSG:data.validationMSG,
                          defaultValue:'********',
                          label: LocaleKeys.confirmPassword.tr(),
                          controller: data.confirmPasswordController,
                        ),

                      ],
                    ),
                  ),
                  CustomButton(
                    // loading: data.isLoading,
                    onTap: () {
                      print('ccccccccc${ provider.saveUserData.getUserData()?.data?.auth?.token??''}');
                      data.onSubmit(context);
                    },
                    title: LocaleKeys.confirm.tr(),
                  )
                ],
              ),
            );
          }
        ));
  }
}
