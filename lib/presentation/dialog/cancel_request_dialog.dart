// import 'package:adhmn/core/extensions/num_extensions.dart';
// import 'package:adhmn/core/res/text_styles.dart';
// import 'package:adhmn/core/resources/resources.dart';
// import 'package:adhmn/core/routing/navigation_services.dart';
// import 'package:adhmn/generated/assets.dart';
// import 'package:adhmn/generated/locale_keys.g.dart';
// import 'package:adhmn/presentation/component/component.dart';
// import 'package:adhmn/presentation/component/inputs/custom_text_field_area.dart';
// import 'package:adhmn/presentation/component/svg_icon.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
//
// class CancelRequestDialog extends StatefulWidget {
//   final ValueChanged<String> _onTap;
//
//
//   const CancelRequestDialog({super.key,
//     required ValueChanged<String> onTap,
//   })  :
//         _onTap = onTap;
//
//   @override
//   State<CancelRequestDialog> createState() => _CancelRequestDialogState();
// }
//
// class _CancelRequestDialogState extends State<CancelRequestDialog> {
//   final TextEditingController _messageController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding:  const EdgeInsets.all(kScreenPaddingNormal),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   tr(LocaleKeys.cancelRequest),
//                   style: TextStyles().getTitleStyle(),
//                   textAlign: TextAlign.center,
//                 ),
//                 GestureDetector(
//                   onTap: ()=>NavigationService.goBack() ,
//                   child:const SVGIcon(Assets.svgExitIcon),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding:  EdgeInsets.all(kScreenPaddingNormal.r),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//
//               children: [
//                 Form(key: _formKey,child:CustomTextFieldArea(hint: tr(LocaleKeys.message),controller: _messageController,textInputAction: TextInputAction.done,iconSVG: Assets.svgMassageIcon)),
//                 VerticalSpace(kScreenPaddingNormal.h),
//                 CustomButton(
//                     title: tr(LocaleKeys.confirmCancel),
//                     color: Colors.black,
//                     onTap: () async {
//                       if (_formKey.currentState != null) {
//                         if (_formKey.currentState!.validate()) {
//                           _formKey.currentState!.save();
//                           NavigationService.goBack();
//                           widget._onTap(_messageController.text);
//                         }
//                       }
//                     })
//               ],
//             ),
//           ),
//           // Column(
//           //   children: [
//           //     Container(
//           //       height: ScreenUtil().setHeight(50),
//           //       decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(30)), color: Theme.of(context).primaryColorDark),
//           //       child: Align(
//           //         alignment: AlignmentDirectional.center,
//           //         child: Text(
//           //           tr(LocaleKeys.booking),
//           //           style: TextStyles(context).getRegularStyle(),
//           //         ),
//           //       ),
//           //     ),
//           //
//           //
//           //     Padding(
//           //       padding: EdgeInsets.all(kFormPaddingAllNormal),
//           //       child: Text(
//           //         _massage,
//           //         textAlign: TextAlign.center,
//           //         style: TextStyles(context).getRegularStyle(),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           // Padding(
//           //   padding: EdgeInsets.symmetric(vertical: kFormFieldTopBottomMargin),
//           //   child: Consumer<CarDetailsViewModel>(
//           //     builder: (context, viewModel, child) =>
//           //     viewModel.isLoading
//           //         ? buildLoadingIndicator(context, size: ScreenUtil().setWidth(40))
//           //         : Column(
//           //             children: [
//           //               Row(
//           //                 children: [
//           //                   Expanded(
//           //                     child: CustomButton(
//           //                       onTap: () => Navigator.pop(context),
//           //                       buttonText: tr(LocaleKeys.cancel),
//           //                       backgroundColor: Theme.of(context).primaryColor,
//           //                     ),
//           //                   ),
//           //                   SizedBox(
//           //                     width: kFormPaddingAllNormal,
//           //                   ),
//           //                   Expanded(
//           //                     child: CustomButton(
//           //                       onTap: (){
//           //                         Navigator.pop(context);
//           //                         _onTap();
//           //                       },
//           //
//           //                       buttonText: tr(LocaleKeys.complete),
//           //                       backgroundColor: Theme.of(context).primaryColorDark,
//           //                     ),
//           //                   ),
//           //                 ],
//           //               ),
//           //             ],
//           //           ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
//
//  showCancelRequestDialog(BuildContext context,{required ValueChanged<String> onTap}) {
//   showDialog(
//     context: context,
//     builder: (context) => Dialog(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
//       alignment: Alignment.center,
//       elevation: 0,
//       backgroundColor: Colors.white,
//       child: SizedBox(
//         // height: 180,
//         child: CancelRequestDialog(
//             onTap:onTap
//
//         ),
//       ),
//     ),
//   );
// }
