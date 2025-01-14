import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/core/helper/socialMediaHelper.dart';
import 'package:pharma_tech_driver/presentation/component/buttons/custom_button.dart';
import 'package:pharma_tech_driver/presentation/modules/home/orderDetails/widgets/phone_cared.dart';
import '../../../../../../core/res/text_styles.dart';
import '../../../../../core/resources/app_assets.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/locale_keys.g.dart';
import '../../../../component/spaces.dart';
import '../../../../component/svg_icon.dart';

class CustomCaredTittle extends StatefulWidget {
  const CustomCaredTittle({super.key});
  @override
  State<CustomCaredTittle> createState() => _CustomCaredTittleState();
}

class _CustomCaredTittleState extends State<CustomCaredTittle> {
SocialMediaHelper socialMediaHelper =SocialMediaHelper();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.r),
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.primaryColor.withOpacity(.03)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SVGIcon(
                    Assets.code,
                    color: AppColors.primaryColor,
                  ),
                  HorizontalSpace(12.w),
                  Text(
                    '#345',
                    style: TextStyles()
                        .getRegularStyle(fontSize: 14.sp)
                        .customColor(AppColors.black),
                  ),
                ],
              ),
              CustomButton(width: 150.w,
                  height: 50.h,
                  color: Colors.transparent,
                  isRounded: false,
                  borderColor: AppColors.black,
                  textStyle: TextStyles().getRegularStyle(fontSize: 14.sp).customColor(AppColors.black),
                  title: "إلغاء التوصيل",
                  textColor: AppColors.black,
                  onTap: (){})
            ],
          ),
          VerticalSpace(20.h),
          Row(
            children: [
              SVGIcon(
                Assets.date,
                color: AppColors.primaryColor,
              ),
              HorizontalSpace(12.w),
              Text(
                '12/12/2012',
                style: TextStyles()
                    .getRegularStyle(fontSize: 14.sp)
                    .customColor(AppColors.black),
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.h),
                child: Text(
                  '-',
                  style: TextStyles()
                      .getRegularStyle(fontSize: 14.sp)
                      .customColor(AppColors.black),
                ),
              ),
              Text(
                 '1:20am',
                style: TextStyles()
                    .getRegularStyle(fontSize: 14.sp)
                    .customColor(AppColors.black),
              ),
            ],
          ),
          VerticalSpace(20.h),
          Row(
            children: [
              const SVGIcon(
                Assets.location,
                color: AppColors.primaryColor,
              ),
              HorizontalSpace(12.w),
              InkWell(onTap: (){
                socialMediaHelper.openGoogleMapByAddress('egypt');
              },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LocaleKeys.deliveryAddress.tr(),
                      style: TextStyles()
                          .getRegularStyle(fontSize: 12.sp)
                          .customColor(AppColors.gray),
                    ),
                    VerticalSpace(3.h),
                    SizedBox(
                      width:MediaQuery.of(context).size.width*0.7,
                      child: Text(
                        'egypt',
                        style: TextStyles()
                            .getRegularStyle(fontSize: 14.sp)
                            .customColor(AppColors.black),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          VerticalSpace(20.h),
          Row(
            children: [
              const SVGIcon(
                Assets.paymentMethod,
                color: AppColors.primaryColor,
              ),
              HorizontalSpace(12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.paymentMethod.tr(),
                    style: TextStyles()
                        .getRegularStyle(fontSize: 12.sp)
                        .customColor(AppColors.gray),
                  ),
                  VerticalSpace(3.h),
                  Text(
                    'werfwe'.tr(),
                    style: TextStyles()
                        .getRegularStyle(fontSize: 14.sp)
                        .customColor(AppColors.black),
                  ),
                  VerticalSpace(3.h),
                  // data?.payType == "online"?
                      Row(
                        children: [
                          Text(
                            LocaleKeys.paymentNotMade.tr(),
                            style: TextStyles()
                                .getRegularStyle(fontSize: 14.sp)
                                .customColor(AppColors.black),
                          ),
                          SizedBox(width: 25.w,),
                          // data?.isPaid == false ?
                              InkWell(
                                onTap: (){
                                  // Provider.of<ShoppingCaredViewModel>(context, listen: false).payment(context,data?.id ?? 0);
                                },
                                child: Container(
                                  height: 35.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Center(
                                    child: Text(
                                     LocaleKeys.pay.tr(),
                                      style: TextStyles()
                                          .getTitleStyle(fontSize: 14.sp)
                                          .customColor(AppColors.white),
                                    ),
                                  ),
                                ),
                              )
                        ],
                      )
                ],
              ),
            ],
          ),
          VerticalSpace(20.h),
          // (data?.notes!=null)?
          Row(
            children: [
              const SVGIcon(
                Assets.message,
                color: AppColors.primaryColor,
              ),
              HorizontalSpace(12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.notes.tr(),
                    style: TextStyles()
                        .getRegularStyle(fontSize: 12.sp)
                        .customColor(AppColors.gray),
                  ),
                  VerticalSpace(3.h),
                  SizedBox(
                    width:MediaQuery.of(context).size.width*0.7,
                    child: Text(
                      'data?.notes??',
                      style: TextStyles()
                          .getRegularStyle(fontSize: 14.sp)
                          .customColor(AppColors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ],
          ),
          VerticalSpace(20.h),
          Row(
            children: [
              const SVGIcon(
                Assets.mapIcon,
                color: AppColors.primaryColor,
              ),
              HorizontalSpace(12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.addressDetail.tr(),
                    style: TextStyles()
                        .getRegularStyle(fontSize: 12.sp)
                        .customColor(AppColors.gray),
                  ),
                  VerticalSpace(3.h),
                  SizedBox(
                    width:MediaQuery.of(context).size.width*0.7,
                    child: InkWell(
                      onTap: (){
                        socialMediaHelper.openGoogleMapByAddress('Egypt');
                      },
                      child: Text(
                        'data?.addressDetails??',
                        style: TextStyles()
                            .getRegularStyle(fontSize: 14.sp)
                            .customColor(AppColors.black),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          PhoneCared(name: 'Islam Ali', phone: '01015021067', image: 'ewe',)

        ],
      ),
    );
  }
}
