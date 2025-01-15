// import 'dart:io';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
// import 'package:pharma_tech_driver/data/model/body/update_profile_body.dart';
// import 'package:pharma_tech_driver/presentation/component/component.dart';
// import 'package:provider/provider.dart';
// import '../../../../../core/resources/resources.dart';
// import '../../../component/animation/list_animator.dart';
// import '../../../component/appbars/custom_app_bar.dart';
// import '../../../component/custom_scaffold.dart';
// import '../../../component/svg_icon.dart';
// import '../../auth/auth_view_model.dart';
//
// class ModifyTheAccount extends StatefulWidget {
//   ModifyTheAccount({Key? key}) : super(key: key);
//
//   @override
//   State<ModifyTheAccount> createState() => _ModifyTheAccountState();
// }
//
// class _ModifyTheAccountState extends State<ModifyTheAccount> {
//   File? _image;
//
//   Future<void> _getImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);
//     setState(() {
//       _image = pickedFile != null ? File(pickedFile.path) : null;
//     });
//   }
//
//   final TextEditingController _firstNameController = TextEditingController();
//
//   final TextEditingController _lastNameController = TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//
//   void _onSubmit(context) async {
//     UpdateProfileBody updateProfileBody = UpdateProfileBody();
//     if (_formKey.currentState != null) {
//       if (_formKey.currentState!.validate()) {
//         _formKey.currentState!.save();
//         String firstName = _firstNameController.text;
//         String lastName = _lastNameController.text;
//         if (firstName.isEmpty) {
//         } else if (lastName.isEmpty) {
//         } else {
//           updateProfileBody.firstName = _firstNameController.text;
//           updateProfileBody.lastName = _lastNameController.text;
//           updateProfileBody.image = _image;
//           Provider.of<AuthViewModel>(context, listen: false)
//               .updateProfile(context, updateProfileBody);
//           // updateProviderData(context);
//         }
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     bool isLoading = context.watch<AuthViewModel>().isLoading;
//     // final image = Provider.of<AuthViewModel>(context, listen: true)
//     //     .saveUserData
//     //     .getUserData()
//     //     ?.data
//     //     ?.delegate
//     //     ?.image;
//     return CustomScaffold(
//         appBar: CustomAppBar(
//           title: LocaleKeys.modifyTheAccount.tr(),
//           titleColor: AppColors.black,
//         ),
//         body: Padding(
//           padding:
//               EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h, bottom: 33.h),
//           child: ListAnimator(
//             children: [
//               // InkWell(
//               //   onTap: () {
//               //     showModalBottomSheet(
//               //       context: context,
//               //       shape: RoundedRectangleBorder(
//               //           borderRadius: BorderRadius.vertical(
//               //         top: Radius.circular(20.r),
//               //       )),
//               //       builder: (BuildContext context) {
//               //         return SafeArea(
//               //           child: Column(
//               //             mainAxisSize: MainAxisSize.min,
//               //             children: <Widget>[
//               //               ListTile(
//               //                 leading: const Icon(Icons.camera_alt),
//               //                 title: Text('takePicture'.tr()),
//               //                 onTap: () {
//               //                   _getImage(ImageSource.camera);
//               //                   Navigator.pop(context);
//               //                 },
//               //               ),
//               //               ListTile(
//               //                 leading: const Icon(Icons.image),
//               //                 title: Text('chooseFromGallery'.tr()),
//               //                 onTap: () {
//               //                   _getImage(ImageSource.gallery);
//               //                   Navigator.pop(context);
//               //                 },
//               //               ),
//               //             ],
//               //           ),
//               //         );
//               //       },
//               //     );
//               //   },
//               //   child: Center(
//               //     child: Stack(
//               //       children: [
//               //         if (_image == null)
//               //           ClipRRect(
//               //             borderRadius: BorderRadius.circular(16.r),
//               //             child: SizedBox(
//               //               height: 96.h,
//               //               width: 96.w,
//               //               child: CachedNetworkImage(
//               //                   fit: BoxFit.fill,
//               //                   imageUrl: image ?? '',
//               //                   errorWidget: (context, url, error) => Container(
//               //                         height: 96.h,
//               //                         width: 96.w,
//               //                         decoration: const BoxDecoration(
//               //                           image: DecorationImage(
//               //                             image: AssetImage(Assets.person),
//               //                           ),
//               //                         ),
//               //                         // Image.asset(
//               //                         //   Assets.splash,
//               //                         //   fit: BoxFit.cover,
//               //                         // ),
//               //                       )),
//               //             ),
//               //           ),
//               //         if (_image != null)
//               //           ClipRRect(
//               //             borderRadius: BorderRadius.circular(16.r),
//               //             child: SizedBox(
//               //               height: 124.h,
//               //               width: 124.w,
//               //               child: Image.file(
//               //                 _image!,
//               //                 fit: BoxFit.fill,
//               //               ),
//               //             ),
//               //           ),
//               //         Positioned(
//               //             bottom: 6.h,
//               //             right: 10.w,
//               //             child: const SVGIcon(Assets.add))
//               //       ],
//               //     ),
//               //   ),
//               // ),
//               VerticalSpace(32.h),
//               _buildForm(context),
//               VerticalSpace(369.h),
//               CustomButton(
//                 loading: isLoading,
//                 onTap: () {
//                   _onSubmit(context);
//                 },
//                 title: LocaleKeys.confirm.tr(),
//                 width: double.infinity,
//               )
//             ],
//           ),
//         ));
//   }
//
//   _buildForm(BuildContext context) {
//     final provider = Provider.of<AuthViewModel>(context, listen: false);
//     return Form(
//       key: _formKey,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             // width: 167.5.w,
//             child: CustomTextFieldNormal(
//               defaultValue:
//                   provider.saveUserData.getUserData()?.data?.delegate?.name,
//               label: LocaleKeys.firstName.tr(),
//               controller: _firstNameController,
//             ),
//           ),
//           // HorizontalSpace(AppSize.s8.w),
//           // SizedBox(
//           //   width: 167.5.w,
//           //   child: CustomTextFieldNormal(
//           //     defaultValue:
//           //         provider.saveUserData.getUserData()?.data?.user?.lastName,
//           //     label: LocaleKeys.lastName.tr(),
//           //     controller: _lastNameController,
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
