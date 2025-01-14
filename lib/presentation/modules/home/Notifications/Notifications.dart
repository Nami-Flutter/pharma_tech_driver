import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import '../../../../../../../core/res/text_styles.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../component/appbars/custom_app_bar.dart';
import '../../../component/custom_scaffold.dart';


class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    // Provider.of<HomeViewModel>(context, listen: false).getNotification(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final isLoading = Provider.of<HomeViewModel>(context, listen: true).isLoading;
    return SafeArea(
      child: CustomScaffold(
          appBar: CustomAppBar(
            title: LocaleKeys.notification.tr(),
            titleColor: AppColors.black,
            color: AppColors.white,
          ),
         body:  RefreshIndicator(
                 onRefresh: () async {
                   // Provider.of<HomeViewModel>(context, listen: false).getNotification(context);
                 },
                 child:
    // isLoading == false? Padding(
    //                padding: const EdgeInsets.all(8.0),
    //                child: data.notificationModel?.data?.length==0? const NoDataScreen():
    ListView.builder(
                     itemCount: 100,
                     itemBuilder: (context, index) {
                       return Padding(
                         padding:
                         EdgeInsets.only(top: 16.h, right: 12.w, left: 12.w),
                         child: InkWell(
                           onTap: (){
                             // if(data.notificationModel?.data?[index].type == "order"){
                             // push(OrderDetails(orderId: data.notificationModel?.data?[index].orderId.toString() ?? ""));}
                           },
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                // ' data.notificationModel?.data?[index].body',
                                'السلام عليكم ورحمه الله وبركاته',
                                 style: TextStyles()
                                     .getTitleStyle(fontSize: 14.sp)
                                     .customColor(AppColors.black),
                               ),
                               Text(
                                 // 'data.notificationModel?.data?[index].createdAt.toString()??',
                                 '20:22',
                                 style: TextStyles()
                                     .getRegularStyle(fontSize: 14.sp)
                                     .customColor(AppColors.gray),
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
                   ),
                 )
              ));
  }
}
