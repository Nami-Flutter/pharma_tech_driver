import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/core/helper/socialMediaHelper.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../core/routing/route.dart';
import '../../../../data/model/response/home_orders_model.dart';
import '../../../component/component.dart';
import '../../../component/svg_icon.dart';
import '../orderDetails/orderDetails.dart';

class CustomCared extends StatefulWidget {
  const CustomCared({
    super.key,

     this.data,
  });

  final OneOrder? data;

  @override
  State<CustomCared> createState() => _CustomCaredState();
}

class _CustomCaredState extends State<CustomCared> {
  SocialMediaHelper socialMediaHelper =SocialMediaHelper();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.grayLight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '#${widget.data?.orderId}',
                style: const TextStyle()
                    .titleStyle(fontSize: 18.sp)
                    .customColor(AppColors.primaryColor),
              ),
              InkWell(
                onTap: () {
                  push(OrderDetails(orderId: widget.data?.id.toString()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LocaleKeys.details.tr(),
                      style: const TextStyle()
                          .bodyStyle()
                          .customColor(AppColors.primaryColor),
                    ),
                    HorizontalSpace(8.w),
                  ],
                ),
              ),
            ],
          ),
          VerticalSpace(16.h),
          Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SVGIcon(
                    Assets.date,
                  ),
                  HorizontalSpace(10.w),
                  Text(
                    widget.data?.order?.date??'',
                    style: TextStyles()
                        .getRegularStyle()
                        .customColor(AppColors.black),
                  ),
                ],
              ),
              HorizontalSpace(60.w),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SVGIcon(
                    Assets.hour,
                  ),
                  HorizontalSpace(10.w),
                  Text(
                    widget.data?.order?.time??'',
                    style: const TextStyle().bodyStyle(),
                  ),
                ],
              ),
            ],
          ),
          VerticalSpace(16.h),
          Row(
            children: [
              SVGIcon(
                Assets.address,color: AppColors.black,
              ),
              HorizontalSpace(10.w),
              Expanded(
                child: InkWell(onTap: (){
                  socialMediaHelper.openGoogleMapByAddress(widget.data?.order?.address??'');
                },
                  child: Text(
                    widget.data?.order?.address??"",
                    style: TextStyles()
                        .getRegularStyle(fontSize: 14.sp)
                        .customColor(AppColors.black),
                    softWrap: false,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
            Container(
              margin: EdgeInsets.only(top: 16.h),
              height: 41.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.w,color: AppColors.orderCaredColor),
                  borderRadius: BorderRadius.circular(12.r),
                  color: widget.data?.status == 'new' ? AppColors.second.withOpacity(.1):
                  widget.data?.status == 'on_way' ?AppColors.green.withOpacity(.2):
                  widget.data?.status == 'ended' ? AppColors.primaryColor.withOpacity(.2):AppColors.errorColor.withOpacity(.2),
              ),
              child: Center(
                child: Text(
                widget.data?.status == 'new' ?LocaleKeys.new1.tr():
                widget.data?.status  == 'on_way' ?LocaleKeys.on_way.tr():
                widget.data?.status  == 'ended' ?LocaleKeys.expiredOrder.tr():
                    LocaleKeys.done.tr(),
                  style: TextStyles()
                      .getRegularStyle(fontSize: 14.sp)
                      .customColor(AppColors.primaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
            )
        ],
      ),
    );
  }
}


