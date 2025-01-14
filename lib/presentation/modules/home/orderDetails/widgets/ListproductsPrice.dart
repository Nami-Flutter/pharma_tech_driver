import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/app_colors.dart';
import '../../../../../../../../core/resources/locale_keys.g.dart';
import '../../../../../data/datasource/locale/locale_data_source.dart';
import '../../../../../data/model/response/oneOrderModel.dart';

class ListProductsPrice extends StatelessWidget {
  const ListProductsPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(constraints: BoxConstraints(maxHeight:MediaQuery.of(context).size.height.h, minHeight: 56.0.h),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(margin: EdgeInsets.symmetric(vertical: 6.h),
              height: 25.h,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      // 'oneOrderModel?.details?[index].product?.title??''',
                      'مضاد حيوي',
                      style: TextStyles()
                          .getRegularStyle(
                        fontSize: 14.sp,
                      ).customColor(AppColors.black),
                      maxLines: 1,
                    //  overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: '3',
                                  // text: '${(oneOrderModel?.details?[index].product?.weightUnit ?? 0.0) * (oneOrderModel?.details?[index].qty ?? 0)}',
                                 // text: "${oneOrderModel?.details?[index].qty}",
                                  style: TextStyles()
                                      .getTitleStyle(
                                    fontSize: 14.sp,
                                  )
                                      .customColor(
                                      AppColors.gray),
                                ),
                                TextSpan(
                                  text: 'x',
                                  style: TextStyles()
                                      .getRegularStyle(
                                    fontSize: 12.sp,
                                  )
                                      .customColor(
                                      AppColors.gray),
                                ),
                              ],
                            ),
                          ),
                          // Text(
                          //  " ${oneOrderModel?.details?[index].product?.unit}"??'',
                          //   style: TextStyles()
                          //       .getRegularStyle(fontSize: 12.sp,)
                          //       .customColor(AppColors.primaryColor),
                          //   maxLines: 1,
                          //  // overflow: TextOverflow.ellipsis,
                          // ),
                          SizedBox(
                            width:MediaQuery.of(context).size.width * 0.1,
                          ),
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  // text: "${double.parse(((oneOrderModel?.details?[index].qty ?? 0) * (oneOrderModel?.details?[index].product?.priceWeightUnit ?? 0)).toString()??'').toPrecision(1)}",
                                  text: "10",
                                  style: TextStyles()
                                      .getTitleStyle(
                                    fontSize: 18.sp,
                                  )
                                      .customColor(
                                      AppColors.black),
                                ),
                                TextSpan(
                                  text: LocaleKeys.sar.tr(),
                                  style: TextStyles()
                                      .getRegularStyle(
                                    fontSize: 12.sp,
                                  )
                                      .customColor(
                                      AppColors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          })
    );
  }
}
