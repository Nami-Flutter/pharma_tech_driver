import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../../../injection.dart';
import '../../auth/auth_view_model.dart';

class CustomSettingCared extends StatelessWidget {
  const CustomSettingCared({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SaveUserData getUserId =getIt();
    final provider = Provider.of<AuthViewModel>(context, listen: true)
        .saveUserData
        ?.getUserData()
        ?.data
        ?.user;
    print('save#####${provider?.image??''}');
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child:
              SizedBox(
                height: 96.h,
                width: 96.w,
                child:(getUserId.getUserData()?.data?.user?.id !=null)? CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: provider?.image??'',
                errorWidget: (context, url, error) =>
                    Container(
                      height: 96.h,
                      width: 96.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.person),
                        ),
                      ),
                      // Image.asset(
                      //   Assets.splash,
                      //   fit: BoxFit.cover,
                      // ),
                    )
                ):Image.asset(Assets.iconApp,fit: BoxFit.cover,),
              ),
            ),
          ],
        ),
        label((getUserId.getUserData()?.data?.user?.id !=null)?'${provider?.firstName ?? ''} ${provider?.lastName ?? ''}':LocaleKeys.pharmaTech.tr()),
      ],
    );
  }

  Widget label(String label, {Color color = AppColors.black}) {
    return Padding(
      padding: EdgeInsets.only(top: AppPadding.p12.h, bottom: 28.h),
      child: Text(
        label,
        style: TextStyles().getTitleStyle(fontSize: 18.sp).customColor(color),
      ),
    );
  }
}
