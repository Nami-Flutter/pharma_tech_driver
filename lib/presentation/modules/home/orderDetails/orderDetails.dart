import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/data/model/response/home_orders_model.dart';
import 'package:pharma_tech_driver/presentation/modules/home/orderDetails/order_details_view_model.dart';
import 'package:pharma_tech_driver/presentation/modules/home/orderDetails/widgets/caredTittle.dart';
import 'package:pharma_tech_driver/presentation/modules/home/orderDetails/widgets/orderBillCard.dart';
import 'package:pharma_tech_driver/presentation/modules/home/orderDetails/widgets/state_cared.dart';
import 'package:provider/provider.dart';
import '../../../../../core/resources/locale_keys.g.dart';
import '../../../../core/app_loader.dart';
import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../component/animation/list_animator.dart';
import '../../../component/appbars/custom_app_bar.dart';
import '../../../component/buttons/custom_button.dart';
import '../../../component/custom_scaffold.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({
    Key? key,
    required this.orderId,
  }) : super(key: key);
  final String? orderId;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<OrderDetailsViewModel>(context, listen: false)
          .getOrder(widget.orderId.toString());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.orderDetails.tr(),
        ),
        body: Consumer<OrderDetailsViewModel>(builder: (context, data, _) {
          return data.isLoading
              ? const AppLoader()
              : ListAnimator(
                  children: [
                    InkWell(onTap:(data.oneOrderModel?.data?.status =='ended')?(){}:
                        (){
                      data.updateOrder(
                          data.oneOrderModel?.data?.id.toString() ?? '',
                          (data.oneOrderModel?.data?.status == 'new')
                              ? 'on_way'
                              : (data.oneOrderModel?.data?.status ==
                              'on_way')
                              ? 'ended'
                              : '');
                    },
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          width: 335.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: AppColors.grayLight),
                          child: Stack(
                            children: [
                              Row(mainAxisSize: MainAxisSize.min,
                                  children: [
                                Container(
                                  width: (data.oneOrderModel?.data?.status == 'new') ? 83.67.w : (data.oneOrderModel?.data?.status == 'on_way') ? 180.5.w : 335.w,
                                  // height: 12.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      color: ((data.oneOrderModel?.data?.status == 'canceled')?AppColors.errorColor:AppColors.primaryColor)),
                                ),
                              ]),
                              Align(alignment: Alignment.center,
                                child: Text(
                                  (data.oneOrderModel?.data?.status == 'new')
                                      ? LocaleKeys.receiveOrder.tr()
                                      : (data.oneOrderModel?.data?.status == 'on_way')
                                      ? LocaleKeys.on_way.tr()
                                      :(data.oneOrderModel?.data?.status == 'canceled')
                                      ? LocaleKeys.cancelledRequest.tr()
                                      :LocaleKeys.expiredOrder.tr(),
                                  style: TextStyles()
                                      .getTitleStyle(fontSize:  14.sp)
                                      .customColor((data.oneOrderModel?.data?.status == 'ended'||data.oneOrderModel?.data?.status == 'on_way'||data.oneOrderModel?.data?.status == 'canceled')?AppColors.white:Colors.black),
                                  textAlign: TextAlign.center,
                                ),)
                            ],
                          )),
                    ),
                    CustomCaredTittle(oneOrder: data.oneOrderModel),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 16.w, left: 16.w, bottom: 22.h),
                      child: OrderBillCard(oneOrder: data.oneOrderModel),
                    )
                  ],
                );
        }));
  }
}
