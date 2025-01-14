import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/res/text_styles.dart';
import '../../../../../../../core/resources/app_colors.dart';
import '../../../../../../../core/resources/locale_keys.g.dart';
import 'ListproductsPrice.dart';

class OrderBillCard extends StatefulWidget {
  const OrderBillCard(
      {Key? key})
      : super(key: key);

  @override
  State<OrderBillCard> createState() => _BillCardState();
}

class _BillCardState extends State<OrderBillCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.grayTextField),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.products.tr(),
            style: TextStyles()
                .getTitleStyle(
              fontSize: 12.sp,
            )
                .customColor(AppColors.gray),
          ),
          ListProductsPrice(),
          // MySeparator(color: Colors.grey.shade400,),

          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 8.0.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         LocaleKeys.delivery.tr(),
          //         style: TextStyles()
          //             .getRegularStyle(
          //           fontSize: 12.sp,
          //         )
          //             .customColor(AppColors.black),
          //       ),
          //       Text.rich(
          //         TextSpan(
          //           children: <TextSpan>[
          //             TextSpan(
          //               text: '${double.parse(widget.oneOrderModel?.driverCost.toString()??'').toPrecision(1)}',
          //               style: TextStyles()
          //                   .getTitleStyle(
          //                 fontSize: 18.sp,
          //               )
          //                   .customColor(AppColors.black),
          //             ),
          //             TextSpan(
          //               text: LocaleKeys.sar.tr(),
          //               style: TextStyles()
          //                   .getRegularStyle(
          //                 fontSize: 12.sp,
          //               )
          //                   .customColor(AppColors.black),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // MySeparator(color: Colors.grey.shade400,),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 8.0.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         'taxValue'.tr(),
          //         style: TextStyles()
          //             .getRegularStyle(
          //           fontSize: 12.sp,
          //         )
          //             .customColor(AppColors.black),
          //       ),
          //       Text.rich(
          //         TextSpan(
          //           children: <TextSpan>[
          //             TextSpan(
          //               text: '${(widget.oneOrderModel?.taxValue??0).toPrecision(1)}',
          //               style: TextStyles()
          //                   .getTitleStyle(
          //                 fontSize: 18.sp,
          //               )
          //                   .customColor(AppColors.black),
          //             ),
          //             TextSpan(
          //               text: LocaleKeys.sar.tr(),
          //               style: TextStyles()
          //                   .getRegularStyle(
          //                 fontSize: 12.sp,
          //               )
          //                   .customColor(AppColors.black),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // MySeparator(color: Colors.grey.shade400,),
          // if (widget.oneOrderModel?.isPoints  == true)
          //   Padding(
          //     padding: EdgeInsets.symmetric(vertical: 8.0.h),
          //     child: UsePoints(
          //       point: '${widget.oneOrderModel?.pointsCount}',
          //       pointDiscount: '${double.parse(widget.oneOrderModel?.pointsValue.toString()??'').toPrecision(1)}', isFromDetails: true,
          //     ),
          //   ),
          // MySeparator(color: Colors.grey.shade400,),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 8.0.h),
          //   child: DeliveryPrice(
          //     deliveryPrice: widget.oneOrderModel?.deliveryPrice ?? 0.0, isFromDetails: true,
          //   ),
          // ),
          // if (widget.oneOrderModel?.isPoints == true)
          //   MySeparator(color: Colors.grey.shade400,),
          Padding(
            padding: EdgeInsets.only(top:8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.theTotal.tr(),
                  style: TextStyles()
                      .getTitleStyle(
                    fontSize: 14.sp,
                  )
                      .customColor(AppColors.black),
                ),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        // text: '${(widget.oneOrderModel?.grandTotal ?? 0.0).toPrecision(1)}',
                        text: '239',
                        style: TextStyles()
                            .getTitleStyle(
                          fontSize: 20.sp,
                        )
                            .customColor(AppColors.primaryColor),
                      ),
                      TextSpan(
                        text: LocaleKeys.sar.tr(),
                        style: TextStyles()
                            .getRegularStyle(
                          fontSize: 18.sp,
                        )
                            .customColor(AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
