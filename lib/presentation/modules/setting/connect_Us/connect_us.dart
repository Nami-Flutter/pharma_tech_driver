import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/presentation/component/component.dart';
import 'package:pharma_tech_driver/presentation/modules/setting/settingViewModel.dart';
import 'package:provider/provider.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../data/model/body/contactUsBody.dart';
import '../../../component/animation/list_animator.dart';
import '../../../component/appbars/custom_app_bar.dart';
import '../../../component/buttons/custom_button.dart';
import '../../../component/custom_scaffold.dart';
import '../../../component/svg_icon.dart';

class ConnectUs extends StatefulWidget {
  ConnectUs({Key? key}) : super(key: key);

  @override
  State<ConnectUs> createState() => _ConnectUsState();
}

class _ConnectUsState extends State<ConnectUs> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _subjectController = TextEditingController();

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  final loading= Provider.of<SettingViewModel>(context, listen: true).isLoading;
    return CustomScaffold(
        appBar: CustomAppBar(
            title: LocaleKeys.connectUs.tr(),
            titleColor: AppColors.black,),
        body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w,top: 24.h,bottom: 42.h),
          child: ListAnimator(
            children: [
              SVGIcon(
                Assets.connectUsIcon,
                  width: 196.42025756835938.w,
                  height: 150.h
              ),
              VerticalSpace(48.h),
              _buildForm(context),
               VerticalSpace(48.h),
              CustomButton(
                loading: loading,
                  title: LocaleKeys.send.tr(),
                  onTap: () {
                    _onSubmit(context);
                  })
            ],
          ),
        ));
  }

  _buildForm(context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFieldNormal(
              iconSVG: Assets.user,
              hint: LocaleKeys.name.tr(),
              controller: _nameController,
            ),
            VerticalSpace(12.h),
            CustomTextFieldNormal(
              iconSVG: Assets.phoneIcon,
              hint: LocaleKeys.phoneNumber.tr(),
              textInputAction: TextInputAction.done,
              type: TextInputType.phone,
              controller: _phoneController,
            ),
            // VerticalSpace(12.h),
            // CustomTextFieldNormal(
            //   iconSVG: Assets.email1,
            //   hint: LocaleKeys.email.tr(),
            //   controller: _emailController,
            // ),
            VerticalSpace(12.h),
            CustomTextFieldNormal(
              iconSVG: Assets.supject,
              hint: LocaleKeys.messageTitle.tr(),
              controller: _subjectController,
            ),
            VerticalSpace(12.h),
            CustomTextFieldArea(
              hintStyle: TextStyle(),
               iconSVG: Assets.notes,
              hint: LocaleKeys.message.tr(),
              controller: _messageController,
            ),
          ],
        ));
  }
  void _onSubmit(context) async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        String _name = _nameController.text;
        String _phone = _phoneController.text;
        // String _email = _emailController.text;
        String _subject = _subjectController.text;
        String _message = _messageController.text;
        //
        // if (_name.isEmpty) {
        //   ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        //     content: Text('nameIsRequired'.tr()),
        //     backgroundColor: Colors.red,
        //   ));
        // } else if (_email.isEmpty) {
        //   ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          //   content: Text("emailIsRequired".tr()),
          //   backgroundColor: Colors.red,
          // ));
          // return;
        // } else
        //   if (_email.isValidEmail() == false) {
        //   ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        //     content: Text("checkYourEmail".tr()),
        //     backgroundColor: Colors.red,
        //   ));
        //   return;
        // } else if (_subject.isEmpty) {
        //   ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        //     content: Text("phoneIsRequired".tr()),
        //     backgroundColor: Colors.red,
        //   ));
        //   return;
        // }else if (_message.isEmpty) {
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     content: Text("messageIsRequired".tr()),
        //     backgroundColor: Colors.red,
        //   ));
        //   return;
        // } else {
         ContactUsBody _body = ContactUsBody();
         _body.name = _name;
          // _body.email = _email;
          _body.phone = _phone;
          _body.subject = _subject;
         _body.message = _message;

          Provider.of<SettingViewModel>(context, listen: false).contactUsApi(context,_body).then((value) {
            // if (value.response?.statusCode == 200) {
            //   ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            //     content: Text('sentSuccesfully'.tr()),
            //     backgroundColor: Colors.green,
            //   ));
            //
            //   Navigator.pop(context);
            // } else {
            //   ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            //     content: Text('SomeThingWrong'.tr()),
            //     backgroundColor: Colors.green,
            //   ));
            // }
         });
      }}}}


