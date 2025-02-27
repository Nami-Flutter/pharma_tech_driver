import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma_tech_driver/core/extensions/num_extensions.dart';
import 'package:pharma_tech_driver/presentation/modules/setting/update_profile/update_profile_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/app_assets.dart';
import '../../../../../main.dart';
import '../../../../component/svg_icon.dart';

class UpdateProfileImage extends StatefulWidget {
  const UpdateProfileImage({super.key});

  @override
  State<UpdateProfileImage> createState() => _UpdateProfileImageState();
}

class _UpdateProfileImageState extends State<UpdateProfileImage> {
  final provider = Provider.of<UpdateProfileViewModel>(navigator.currentContext!, listen: false);

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileViewModel>(
      builder: (context,data,_) {
        print('bbbbbbbbb${provider.saveUserData.getUserData()?.data?.delegate?.image}');
        return InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  )),
              builder: (BuildContext context) {
                return SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.camera_alt),
                        title: Text('takePicture'.tr()),
                        onTap: () {
                          data.getImage(ImageSource.camera);
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.image),
                        title: Text('chooseFromGallery'.tr()),
                        onTap: () {
                          data.getImage(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Center(
            child: Stack(
              children: [
                if (data.image == null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: SizedBox(
                      height: 96.h,
                      width: 96.w,
                      child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: provider.saveUserData.getUserData()?.data?.delegate?.image ?? '',
                          errorWidget: (context, url, error) => Container(
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
                          )),
                    ),
                  ),
                if (data.image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: SizedBox(
                      height: 124.h,
                      width: 124.w,
                      child: Image.file(
                        data.image!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                Positioned(
                    bottom: 5.h,
                    right: 5.w,
                    child: const SVGIcon(Assets.add))
              ],
            ),
          ),
        );
      }
    );
  }
}
