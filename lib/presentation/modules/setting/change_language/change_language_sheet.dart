import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/core/resources/locale_keys.g.dart';
import 'package:pharma_tech_driver/injection.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/logger.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../../main.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../../component/buttons/custom_button.dart';
import '../../../component/screen_state_layout.dart';
import '../../../component/spaces.dart';
import '../../auth/auth_view_model.dart';

class ChangeLanguageSheet extends StatefulWidget {
  @override
  State<ChangeLanguageSheet> createState() => _ChangeLanguageSheetState();

  const ChangeLanguageSheet({super.key});
}

class _ChangeLanguageSheetState extends State<ChangeLanguageSheet> {
  SaveUserData saveUserData = getIt();

  final tag = 'ChangeLanguageSheet';
  late Locale locale = context.locale;
  @override
  void initState() {
    super.initState();
    // locale = context.locale
  }

  Future<void> _onLanguageSelected() async {
    log('onLanguageSelected', 'change language to (${locale.languageCode})');
    saveUserData.saveLang(locale.languageCode);
    if (saveUserData.getUserData()?.data?.user?.id !=null) {
      Provider.of<AuthViewModel>(context,listen: false).updateFCMToken();
    }
    Navigator.pop(context);
    context.setLocale(locale) ;
  }

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
                  tr(LocaleKeys.language),
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
              builder: (context) => buildBody(context,
                  items: supportedLocales, selectedItem: locale),
            ),
             VerticalSpace(kScreenPaddingNormal.h),
            CustomButton(
              onTap: () {
                _onLanguageSelected();
              },
              title: LocaleKeys.confirm.tr(),
              width: double.infinity,
            )
          ]),
    );
  }

  Widget buildBody(BuildContext context, {required List<Locale> items, required Locale selectedItem}) {
    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 2),
      child: ListView(
          shrinkWrap: true,
          children: items.map((e) => buildSingleChoiceItem(context, selectedItem, e)).toList()),
    );
  }

  Widget buildSingleChoiceItem(BuildContext context, Locale selectedItem, Locale item) {
    return RadioListTile<Locale>(
      contentPadding: EdgeInsets.zero,
      activeColor: AppColors.primaryColor,
      groupValue: selectedItem,
      title: Text(item.languageCode=='en'?'English':'عربي',style: const TextStyle().bodyStyle().customColor(AppColors.black),),
      value: item,
      onChanged: (value) {
        if (value != null) {
          setState(() {
            locale = value;
          });
        }
      },
    );
  }
}

