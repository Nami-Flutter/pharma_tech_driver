import 'package:flutter/cupertino.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';

import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/locale_keys.g.dart';

class StateOrder extends StatelessWidget {
  const StateOrder({Key? key, required this.state}) : super(key: key);
  final String state;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 311.w,
        height: 8.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color: AppColors.grayLight),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _stateContainer(),
          ],
        ));
  }

  Container _stateContainer() {
    return Container(
      width: state == LocaleKeys.approved
          ? 83.67.w
          : state == LocaleKeys.preparing
          ? 135.5.w
          : state == LocaleKeys.prepared
          ? 187.33.w
          : state == LocaleKeys.representative
          ? 227.33.w
          : state == LocaleKeys.progress
          ? 269.17.w
          : state == LocaleKeys.done
          ? 311.w
          : state == LocaleKeys.received
          ? 51.83.w
          : 311.w,
      height: 12.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: (state == LocaleKeys.orderCanceled||state == LocaleKeys.orderCanceledFromStore||state == LocaleKeys.RequestDriverCancelled)?AppColors.errorColor:AppColors.primaryColor),
    );
  }

  double _widthValue(String state) {
    double stateValue = 0;
    if (state == LocaleKeys.approved) {
      return 103.67.w;
    } else if (state == LocaleKeys.preparing) {
      return 155.5.w;
    } else if (state == LocaleKeys.representative) {
      return 207.33.w;
    } else if (state == LocaleKeys.progress) {
      return 259.17.w;
    } else if (state == LocaleKeys.done) {
      return 311.w;
    } else {
      return 51.83.w;
    }
    //
  }
}
