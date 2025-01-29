import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/core/routing/route.dart';
import 'package:pharma_tech_driver/data/repository/SaveUserData.dart';
import 'package:pharma_tech_driver/injection.dart';
import 'package:pharma_tech_driver/main.dart';
import 'package:pharma_tech_driver/presentation/component/component.dart';
import 'package:pharma_tech_driver/presentation/modules/home/provider/home_provider.dart';
import 'package:pharma_tech_driver/presentation/modules/home/widget/custom_list_view.dart';
import 'package:pharma_tech_driver/presentation/modules/setting/setting.dart';
import 'package:provider/provider.dart';

import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/locale_keys.g.dart';
import '../../component/svg_icon.dart';
import 'Notifications/Notifications.dart';
import 'Notifications/provider/notifications_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SaveUserData saveUserData =getIt();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<NotificationViewModel>(context, listen: false).getAllNotification();});
    _loadData();
    super.initState();
  }

  Future<void> _loadData() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      navigator.currentContext!.read<HomeViewModel>().initMyOrders();
      Provider.of<HomeViewModel>(context, listen: false).getAllOrders();});}
  int isClicked = 0;
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: CustomAppBar(
          titleWidget: Row(
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(12.r),
              //   child: CachedNetworkImage(
              //       imageUrl: 'widget.imageUrl ??' ,
              //       height: 40.h,
              //       width: 40.w,
              //       fit: BoxFit.fill,
              //       placeholder: (context, url) => Container(
              //         color: Theme.of(context).primaryColor,
              //         padding: EdgeInsets.all(6.sp),
              //         child: const SVGIcon(Assets.logo,),
              //       ),
              //       errorWidget: (context, url, error) => Container(
              //           padding: EdgeInsets.all(4.sp),
              //           color: Theme.of(context).primaryColor,
              //           child: Icon(Icons.error_outline)
              //       )),
              // ),
              SizedBox(width: 5.w),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                 tr(LocaleKeys.hello),
                  style: const TextStyle()
                      .bodyStyle(fontSize: FontSize.s12.sp)
                      .customColor(AppColors.gray),
                ),
                SizedBox(height: 5.w),
                Text(
                  saveUserData.getUserData()?.data?.delegate?.name??'',
                  style: const TextStyle()
                      .titleStyle(fontSize: FontSize.s16.sp)
                      .customColor(AppColors.black),
                ),
              ],)
            ],
          ),
          actions: [Row(children: [
            InkWell(onTap: (){
              push(Notifications());
            },
              child: Container(width: 48.w,height: 48.h,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r),color: AppColors.lightGray),
                child:Stack(
                  children: [
                    Center(child: SVGIcon(Assets.notificationIcon,width: 24.w,height: 24.h)),
                    Positioned(top: 5,right: 10,
                        child:
                    Container(alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal:2.w),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r),color: AppColors.green),
                      child: Selector<NotificationViewModel, int?>(
                          selector: (context, counter) => counter.notificationModel?.data?.length??0,
                          builder: (context, count, child) {
                          return Text(
                            count.toString(),
                            style: const TextStyle()
                                .bodyStyle(fontSize: FontSize.s10.sp)
                                .customColor(AppColors.white),
                            textAlign: TextAlign.center,
                          );
                        }
                      ),
                    ))
                  ],
                ) ,),
            ),
            InkWell(onTap: (){
              push(Setting());
            },
              child: Container(width: 48.w,height: 48.h,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r),color: AppColors.lightGray),
                child:Center(child: SVGIcon(Assets.settingSelect,color: AppColors.black,width: 24.w,height: 24.h)) ,),
            ),
            SizedBox(width: 10.w),
          ],)],
          isBackButtonExist: false,
        ),
        body: Consumer<HomeViewModel>(
          builder: (context,data,_) {
            return Column(children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16.w, left: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 110.w,
                          child: CustomButton(
                            onTap: () async {
                              setState(() {
                                isClicked = 0;
                                data.status='new';
                              });
                              controller.animateToPage(isClicked,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeInOut);
                              _loadData();
                            },
                            textColor: isClicked == 0
                                ? AppColors.white
                                : AppColors.gray,
                            color: isClicked == 0 ? AppColors.primaryColor : AppColors.grayLight,
                            title:LocaleKeys.theNew.tr(),
                          ),
                        ),
                        SizedBox(
                          width: 110.w,
                          child: CustomButton(
                            onTap: () async {
                              setState(() {
                                isClicked = 1;
                                data.status='on_way';
                              });
                              controller.animateToPage(isClicked,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeInOut);
                              _loadData();
                            },
                            title: LocaleKeys.current.tr(),
                            // width: 108.67.w,
                            textColor: isClicked == 1
                                ? AppColors.white
                                : AppColors.gray,
                            color: isClicked == 1 ? AppColors.primaryColor : AppColors.grayLight,),
                        ),
                        SizedBox(
                          width: 110.w,
                          child: CustomButton(
                            onTap: () async {
                              setState(() {
                                isClicked = 2;
                                data.status='ended';
                              });
                              controller.animateToPage(isClicked,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeInOut);
                              _loadData();
                            },
                            title: LocaleKeys.previous.tr(),
                            // width: 108.67.w,
                            textColor: isClicked == 2
                                ? AppColors.white
                                : AppColors.gray,
                            color: isClicked == 2 ? AppColors.primaryColor : AppColors.grayLight,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    // flex: 2,
                    child: PageView(
                      controller: controller,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 16.w, left: 16.w),
                          child: CustomListView(
                            model: data.ordersModel,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16.w, left: 16.w),
                          child: CustomListView(
                            model: data.ordersModel,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16.w, left: 16.w),
                          child: CustomListView(
                            model: data.ordersModel,
                          ),
                        )
                      ],
                    ),
                  ),
                ]);
          }
        )

    );
  }
}
