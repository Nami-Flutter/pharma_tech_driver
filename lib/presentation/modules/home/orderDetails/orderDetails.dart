import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/presentation/modules/home/orderDetails/widgets/caredTittle.dart';
import 'package:pharma_tech_driver/presentation/modules/home/orderDetails/widgets/orderBillCard.dart';
import 'package:pharma_tech_driver/presentation/modules/home/orderDetails/widgets/state_cared.dart';
import 'package:provider/provider.dart';
import '../../../../../core/resources/locale_keys.g.dart';
import '../../../../core/app_loader.dart';
import '../../../component/animation/list_animator.dart';
import '../../../component/appbars/custom_app_bar.dart';
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
    // Provider.of<MyOrdersViewModel>(context, listen: false)
    //     .getOneOrderApi(context, widget.orderId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.orderDetails.tr(),
        ),
        body: ListAnimator(
                  children: [
                     CustomStateCared(
                            title:
                            // orderData.oneOrderModel?.data?.status == 'new' ?LocaleKeys.received:
                            // orderData.oneOrderModel?.data?.status == 'accepted'?LocaleKeys.approved:
                            // orderData.oneOrderModel?.data?.status == 'refused' ?LocaleKeys.orderCanceledFromStore:
                            // orderData.oneOrderModel?.data?.status == 'on_progress' ? LocaleKeys.preparing:
                            // orderData.oneOrderModel?.data?.status == 'on_way' ? LocaleKeys.progress:
                            // orderData.oneOrderModel?.data?.status == 'delivery_progress' ?LocaleKeys.representative:
                            // orderData.oneOrderModel?.data?.status == 'ended' ?LocaleKeys.done:
                            // orderData.oneOrderModel?.data?.status == 'canceled' ?LocaleKeys.orderCanceled:
                            // orderData.oneOrderModel?.data?.status == 'progress_done' ?LocaleKeys.prepared:
                            // orderData.oneOrderModel?.data?.status == 'driver_canceled' ?LocaleKeys.RequestDriverCancelled:
                            // orderData.oneOrderModel?.data?.status == 'delivered' ?LocaleKeys.delivered:
                            LocaleKeys.done,
                            orderId: widget.orderId.toString(),
                       image: 'orderData.oneOrderModel?.data?.driver?.image.toString()??',
                       phone: 'orderData.oneOrderModel?.data?.driver?.phone.toString()??',
                       name: 'orderData.oneOrderModel?.data?.driver?.name.toString()??',
                          ),
                    CustomCaredTittle(),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 16.w, left: 16.w, bottom: 22.h),
                      child: OrderBillCard(),
                    )
                  ],
                ));
  }
}
