import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/app_colors.dart';
import '../../../../../core/helper/socialMediaHelper.dart';
import '../../../../../core/resources/app_assets.dart';
import '../../../../component/spaces.dart';
import '../../../../component/svg_icon.dart';

class PhoneCared extends StatelessWidget {
  const PhoneCared(
      {Key? key, required this.name, required this.phone, required this.image})
      : super(key: key);
  final String name;
  final String phone;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10.w),
      elevation: 2,
      child: Container(
       // margin: EdgeInsets.only(top: 10.w),
        padding: EdgeInsets.all(16.r),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          // boxShadow: [BoxShadow(blurRadius:15 .r,spreadRadius: 0.0003.r,blurStyle: BlurStyle.outer)],
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.white),
        child: Row(
          children: [
            SizedBox(width: 48.w,height: 48.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: image,
                  errorWidget: (context, url, error) =>
                      SVGIcon(
                        Assets.logoHome,
                        height: 48.h,
                        width: 48.w,
                      ),
                ),
              ),
            ),
            HorizontalSpace(12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: TextStyles()
                      .getTitleStyle(fontSize: 14.sp)
                      .customColor(AppColors.black),
                ),
                VerticalSpace(4.h),
                Text(
                  phone,
                  style: TextStyles()
                      .getRegularStyle(fontSize: 12.sp)
                      .customColor(AppColors.gray),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                SocialMediaHelper().launchPhoneCall(phone);
              },
              icon: Icon(
                Icons.call,
                color: AppColors.blue,
                size: 24.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
