import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_colors.dart';
import '../../svg_icon.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomTextFormFiled extends StatelessWidget {
  final Widget? widget;
  final String ?image;
  final String? icon;
  final String? hintText;
  final double? height;
  final Color? backGroundColor;
  final Color? borderColor;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;

  const CustomTextFormFiled({
    Key? key,
    this.widget,
     this.image,
    this.hintText,
    this.controller,
    this.textInputAction,
    this.textInputType, this.height, this.backGroundColor, this.borderColor, this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //top: 22,bottom: 22,
       padding: EdgeInsets.only(right: 16.w,),
      width: double.infinity,
      height: height??64.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 0.9.w,
         color: borderColor??Colors.transparent,
       ),
        boxShadow: const [
          BoxShadow(color: AppColors.white, spreadRadius: 0),
        ],
        color: backGroundColor??AppColors.main10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(

            children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget == null ? false : true,
                  autofocus: false,

                  decoration: InputDecoration(
                    icon:icon==null ?const SizedBox():SVGIcon(
                      icon??'',
                      //'assets/images/svg$image.svg',
                      width: (24.w),
                      height: (16.h),
                    ),
                    suffixIcon:image==null ?const SizedBox(): SVGIcon(
                      image??'',
                      //'assets/images/svg$image.svg',
                      width: (20.w),
                      height: (20.h),
                    ),
                    border: InputBorder.none,
                    hintText: hintText?.tr(),
                    hintStyle: TextStyles()
                        .getRegularStyle(fontSize: 14.sp)
                        .customColor(AppColors.black),
                  ),
                  controller: controller,
                  textInputAction: textInputAction,
                  keyboardType: textInputType ?? TextInputType.text,
                  cursorColor: AppColors.primaryColor,
                  style: TextStyle(
                      letterSpacing: 0.5, fontSize: 18.sp, color: AppColors.black),
                  validator: (value) {
                    return null;
                  },
                  onSaved: (newValue) {},
                ),
              ),


            ],
          ),
          Container(
            child: widget,
          ),

        ],
      ),
    );
  }
}
