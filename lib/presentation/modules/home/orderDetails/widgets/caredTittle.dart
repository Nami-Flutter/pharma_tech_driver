import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/core/helper/socialMediaHelper.dart';
import 'package:pharma_tech_driver/data/model/response/one_order_model.dart';
import 'package:pharma_tech_driver/presentation/component/buttons/custom_button.dart';
import 'package:pharma_tech_driver/presentation/modules/home/orderDetails/widgets/phone_cared.dart';
import '../../../../../../core/res/text_styles.dart';
import '../../../../../core/resources/app_assets.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/locale_keys.g.dart';
import '../../../../../data/model/response/home_orders_model.dart';
import '../../../../component/spaces.dart';
import '../../../../component/svg_icon.dart';
import 'edit_order_button.dart';

class CustomCaredTittle extends StatefulWidget {
  const CustomCaredTittle({super.key, required this.oneOrder});
  final OneOrderModel? oneOrder ;
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
                    '#${widget.oneOrder?.data?.orderId}',
                    style: TextStyles()
                        .getRegularStyle(fontSize: 14.sp)
                        .customColor(AppColors.black),
                  ),
                ],
              ),
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
                widget.oneOrder?.data?.order?.date ?? '',
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
                widget.oneOrder?.data?.order?.time ?? '',
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
                socialMediaHelper.openGoogleMapByAddress(widget.oneOrder?.data?.order?.address??'');
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
                        widget.oneOrder?.data?.order?.address??'',
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
                    widget.oneOrder?.data?.order?.payType??'',
                    style: TextStyles()
                        .getRegularStyle(fontSize: 14.sp)
                        .customColor(AppColors.black),
                  ),
                  // VerticalSpace(3.h),
                  // widget.oneOrder?.order?.payType != "cash"?SizedBox():
                  //     Row(
                  //       children: [
                  //         Text(
                  //           LocaleKeys.paymentNotMade.tr(),
                  //           style: TextStyles()
                  //               .getRegularStyle(fontSize: 14.sp)
                  //               .customColor(AppColors.black),
                  //         ),
                  //         SizedBox(width: 25.w,),
                  // widget.oneOrder?.order?.isPaid == true ?SizedBox():
                  //             InkWell(
                  //               onTap: (){
                  //                 // Provider.of<ShoppingCaredViewModel>(context, listen: false).payment(context,data?.id ?? 0);
                  //               },
                  //               child: Container(
                  //                 height: 35.h,
                  //                 width: 70.w,
                  //                 decoration: BoxDecoration(
                  //                   color: AppColors.primaryColor,
                  //                   borderRadius: BorderRadius.circular(7)
                  //                 ),
                  //                 child: Center(
                  //                   child: Text(
                  //                    LocaleKeys.pay.tr(),
                  //                     style: TextStyles()
                  //                         .getTitleStyle(fontSize: 14.sp)
                  //                         .customColor(AppColors.white),
                  //                   ),
                  //                 ),
                  //               ),
                  //             )
                  //       ],
                  //     )
                ],
              ),
            ],
          ),
          ( widget.oneOrder?.data?.order?.notes==null)?SizedBox(): VerticalSpace(20.h),
          ( widget.oneOrder?.data?.order?.notes!=null)?
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
                       widget.oneOrder?.data?.order?.notes??'',
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
          ):SizedBox(),
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
                        socialMediaHelper.openGoogleMapByAddress( widget.oneOrder?.data?.order?.addressDetails??'');
                      },
                      child: Text(
                        widget.oneOrder?.data?.order?.addressDetails??'',
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

          PhoneCared(name: '${widget.oneOrder?.data?.order?.user?.user?.firstName} ${ widget.oneOrder?.data?.order?.user?.user?.lastName}',
            phone:  '${ widget.oneOrder?.data?.order?.user?.user?.phoneCode }${widget.oneOrder?.data?.order?.user?.user?.phone}', image:  widget.oneOrder?.data?.order?.user?.user?.image??'',)

        ],
      ),
    );
  }
}
