import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/core/resources/locale_keys.g.dart';
import 'package:provider/provider.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../component/buttons/custom_button.dart';
import '../../../component/screen_state_layout.dart';
import '../../../component/spaces.dart';
import '../auth_view_model.dart';

class countrySheet extends StatefulWidget {
  @override
  State<countrySheet> createState() => _countrySheetState();

  const countrySheet({super.key});
}

class _countrySheetState extends State<countrySheet> {
  final tag = 'ChangeCountrySheet';
  late String code=Provider.of<AuthViewModel>(context, listen: false).phoneCode ;
  @override

  void _onCountrySelected() {
    Navigator.pop(context);
    Provider.of<AuthViewModel>(context, listen: false).phoneCodeCountry=code;
  }
  final supportedCountry = <String>[
    '+966',
    '+20',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(bottom: 16.h, top: 24.h,left: 24.w,right: 24.w),
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(36.r)),
          color: AppColors.white),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr(LocaleKeys.country),
                  style: TextStyles().getTitleStyle(fontSize: 18.sp).customColor(AppColors.black),
                ),
                GestureDetector(
                  onTap: ()=> Navigator.pop(context),
                  child:  SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: CircleAvatar(
                      backgroundColor: AppColors.black,
                      child: Center(child: Icon(Icons.close,size: 16.r,color: AppColors.white,)),
                    ),
                  ),
                ),
              ],
            ),

            ScreenStateLayout(
              builder: (context) {
                return buildBody(context,
                  items: supportedCountry, selectedItem: code);
              },
            ),
            VerticalSpace(kScreenPaddingNormal.h),
            CustomButton(
              onTap: () {
                _onCountrySelected();
              },
              title: LocaleKeys.confirm.tr(),
              width: double.infinity,
            )
          ]),
    );
  }

  Widget buildBody(BuildContext context, {required List<String> items, required String selectedItem}) {
    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 2),
      child: ListView(
         // itemCount: 2,
          shrinkWrap: true,
      //       itemBuilder: (BuildContext context, int index) {
      //   buildSingleChoiceItem(context, items: items,  )
      // },
           children: items.map((e) => buildSingleChoiceItem(context, selectedItem,e)).toList(),
      ),
    );
  }

  Widget buildSingleChoiceItem(BuildContext context, String selectedItem ,String items) {
    return RadioListTile<String>(
      contentPadding: EdgeInsets.zero,
      activeColor: AppColors.primaryColor,
      groupValue: selectedItem,
      title: Text(items=='+20'?LocaleKeys.egypt.tr():LocaleKeys.saudiArabia.tr(),style: const TextStyle().bodyStyle().customColor(AppColors.black),),
      value:items,
      onChanged: (value) {
        if (value != null) {
          setState(() {
            code = value;
          });
        }
      },
    );
  }
}

