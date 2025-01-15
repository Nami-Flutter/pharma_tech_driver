
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/core/helper/no_data.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../data/model/response/home_orders_model.dart';
import '../../../../main.dart';
import '../provider/home_provider.dart';
import 'custom_cared.dart';


class CustomListView extends StatelessWidget {
  const CustomListView({
    Key? key,required this.model}) : super(key: key);
  final OrdersModel? model;
  Future<void> _loadData() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      navigator.currentContext!.read<HomeViewModel>().initMyOrders();
      Provider.of<HomeViewModel>(navigator.currentContext!, listen: false).getAllOrders();});}
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context,data,_) {
        print('kkkkkkkkkkkkkkk${model?.data?.length}');
        return RefreshIndicator(
          color: AppColors.primaryColor,
          onRefresh: ()async{
            await  _loadData();},
          child:
          (model?.data?.isEmpty??true)?NoDataScreen():
          ListView.builder(
              controller: data.controller,
              itemCount: model?.data?.length??0,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child:
                  CustomCared(
                    data:model?.data?[index],
                  ),
                );
              }),
        );
      }
    );
  }
}