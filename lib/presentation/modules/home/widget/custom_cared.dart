import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/core/helper/socialMediaHelper.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../core/routing/route.dart';
import '../../../../data/model/response/myOrdersModel.dart';
import '../../../component/component.dart';
import '../../../component/svg_icon.dart';
import '../orderDetails/orderDetails.dart';

class CustomCared extends StatefulWidget {
  const CustomCared({
    super.key,
    required this.type,
     this.data,
  });

  final OneOrder? data;
  final String? type;

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
                '${widget.data?.orderId}',
                style: const TextStyle()
                    .titleStyle(fontSize: 18.sp)
                    .customColor(AppColors.primaryColor),
              ),
              InkWell(
                onTap: () {
                  push(OrderDetails(orderId: widget.data?.id.toString(),));
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
                    '${widget.data?.order?.date}',
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
                    '${widget.data?.order?.time}',
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
                    '${widget.data?.order?.address}',
                    style: TextStyles()
                        .getRegularStyle(fontSize: 14.sp)
                        .customColor(AppColors.black),
                    softWrap: false,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: Container(

                height: 41.w,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.orderCaredColor),
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.white),
                child: Center(
                  child: Text(
                  widget.data?.order?.status == 'new' ?LocaleKeys.received.tr():
                  widget.data?.order?.status  == 'accepted'?LocaleKeys.approved.tr():
                  widget.data?.order?.status  == 'refused' ?LocaleKeys.orderCanceledFromStore.tr():
                  widget.data?.order?.status  == 'on_progress' ?LocaleKeys.preparing.tr():
                  widget.data?.order?.status  == 'on_way' ?LocaleKeys.representative.tr():
                  widget.data?.order?.status  == 'delivery_progress' ?LocaleKeys.progress.tr():
                  widget.data?.order?.status  == 'ended' ?LocaleKeys.done.tr():
                  widget.data?.order?.status  == 'canceled' ?LocaleKeys.orderCanceled.tr():
                  widget.data?.order?.status  == 'progress_done' ?LocaleKeys.prepared.tr():
                  widget.data?.order?.status  == 'driver_canceled' ?LocaleKeys.RequestDriverCancelled.tr():
                      // orderData.oneOrderModel?.data?.status == 'delivered' ?LocaleKeys.done:
                      LocaleKeys.done.tr(),
                    style: TextStyles()
                        .getRegularStyle(fontSize: 14.sp)
                        .customColor(AppColors.primaryColor),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}


