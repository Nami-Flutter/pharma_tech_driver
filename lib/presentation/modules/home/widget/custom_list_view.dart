
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import '../../../../data/model/response/myOrdersModel.dart';
import 'custom_cared.dart';


class CustomListView extends StatelessWidget {
  const CustomListView({
    Key? key,
      required this.type, this.myOrdersModel


  }) : super(key: key);
  final MyOrdersModel? myOrdersModel;
  final String? type;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myOrdersModel?.data?.length,//from API
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 12.h),
            child:
            CustomCared(
              data:myOrdersModel?.data?[index], type: type,
            ),
          );
        });
  }
}