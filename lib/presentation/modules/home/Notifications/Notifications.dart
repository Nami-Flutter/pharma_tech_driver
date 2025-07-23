import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/presentation/component/component.dart';
import 'package:pharma_tech_driver/presentation/modules/home/Notifications/provider/notifications_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/res/text_styles.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../core/app_loader.dart';
import '../../../../core/helper/no_data.dart';
import '../../../../core/routing/route.dart';
import '../../../../main.dart';
import '../../../component/appbars/custom_app_bar.dart';
import '../../../component/custom_scaffold.dart';
import '../../../component/svg_icon.dart';
import '../orderDetails/orderDetails.dart';
import '../provider/home_provider.dart';


class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    _loadData();
    super.initState();
  }
  Future<void> _loadData() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      navigator.currentContext!.read<NotificationViewModel>().initMyNotification();
      Provider.of<NotificationViewModel>(context, listen: false).getNotificationsCount();
      Provider.of<NotificationViewModel>(context, listen: false).getAllNotification();});}
  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<HomeViewModel>(context, listen: true).isLoading;
    return SafeArea(
      child: CustomScaffold(
          appBar: CustomAppBar(
            title: LocaleKeys.notification.tr(),
            titleColor: AppColors.black,
            color: AppColors.white,
            actions: [              Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomButton(
                  width: 120.w,
                  height: 48.h,
                  onTap: (){
                    Provider.of<NotificationViewModel>(context, listen: false).deleteAllNotification(context);
                  }, title: LocaleKeys.deleteAll.tr(), color: AppColors.errorColor, textColor: AppColors.white),
            ),
            ],
          ),
         body:  Consumer<NotificationViewModel>(
           builder: (context,data,_) {
             return RefreshIndicator(
                     onRefresh: () async {
                       _loadData();
                       },
                     child:
                 isLoading == false? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (data.notificationModel?.data?.isEmpty??true)?NoDataScreen():
                 ListView.builder(
                         itemCount: data.notificationList.length ?? 0,
                         itemBuilder: (context, index) {
                           return Padding(
                             padding:
                             EdgeInsets.only(top: 16.h, right: 12.w, left: 12.w),
                             child: InkWell(
                               onTap: (){
                                 if(data.notificationModel?.data?[index].type == "order"){
                                 push(OrderDetails(orderId: data.notificationModel?.data?[index].orderId.toString() ?? ""));}
                               },
                               child: Column(
                                 children: [
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text(
                                             data.notificationList[index]?.body??'',
                                             style: TextStyles()
                                                 .getTitleStyle(fontSize: 14.sp)
                                                 .customColor(AppColors.black),
                                           ),
                                           VerticalSpace(6.h),
                                           Text(
                                           data.notificationList[index]?.createdAt.toString()??'',
                                             style: TextStyles()
                                                 .getRegularStyle(fontSize: 14.sp)
                                                 .customColor(AppColors.gray),
                                           ),
                                         ],
                                       ),
                                       InkWell(
                                           onTap: (){
                                             Provider.of<NotificationViewModel>(context, listen: false).deleteNotification(context,data.notificationModel?.data?[index].id.toString() ?? "");
                                           },child: SVGIcon(Assets.deleteIcon,width:24.w ,height:24.h ))
                                     ],
                                   ),
                                   Container(
                                     margin: EdgeInsets.only(top: 12.h),
                                     decoration: const BoxDecoration(
                                         border: Border(
                                             top:
                                             BorderSide(color: AppColors.primaryColor))),
                                   )

                                 ],
                               ),
                             ),
                           );
                         },
                       ))
                     : const AppLoader(),
                     );
           }
         )
              ));
  }
}
